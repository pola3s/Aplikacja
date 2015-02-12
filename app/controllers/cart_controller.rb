class CartController < ApplicationController
  before_filter :authenticate_user!



  def Index
    find_cart
  end

  def new
    @cart = Cart.new
  end

  def add

    id = params[:id]
    find_cart()
    cart_item = @cart.cart_items.where(item_id: id).first
    if cart_item.nil?
      item = Item.find(id)
      cart_item = CartItem.create(cart: @cart, item: item,count: 1)
    else
      cart_item.increment!(:count)
    end

    redirect_to :action => :Index
  end

  def subtract

    id = params[:id]
    find_cart()
    cart_item = @cart.cart_items.where(item_id: id).first
    cart_item.decrement!(:count)

    redirect_to :action => :Index
  end

  def show

     find_cart

  end



  def save
    id = params[:id]
    find_cart()
    @cart.user = current_user
    @cart.total = @cart.total_price

    respond_to do |format|
      if @cart.save
        format.html { redirect_to items_url, notice: 'Dziękujemy za złożenie zamówienia!' }
        format.json { render :show, status: :created, location: @cart  }
      end

    end
  end

  private
  def find_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  private
  def cart_params
    params.require(
        :cart
    ).permit(
      :total
    )
  end


end


