class CartController < ApplicationController
  before_filter :authenticate_user!



  def Index
    find_cart
  end

  def new
    @cart = Cart.new
  end


  def add
    @cart.save if @cart.new_record?
    session[:cart_id] = @cart.id
    product = Product.find(params[:id])
    LineItem.create! :order => @cart, :product => product, :price => product.price
    @cart.recalculate_price!
    flash[:notice] = "Item added to cart!"
    redirect_to '/cart'
  end




  def add

    id = params[:id]
    find_cart()
    cart_item = @cart.cart_items.where(item_id: id).first
    if cart_item.nil?
      item = Item.find(id)
      cart_item = CartItem.create(cart: @cart, item: item,count: 1)
      flash[:notice] = "Item added to cart!"
    else
      cart_item.increment!(:count)
      flash[:notice] = "Item added to cart!"
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
    #@cart.magazine = @item.id
    @cart.user = current_user1
    @cart.total = @cart.total_price

    @cart.save
    session.delete(:cart_id)
    flash[:notice] = "Twoje zamówienie zostało przyjęte do realizacji!"
    redirect_to "/"

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


