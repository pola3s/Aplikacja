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
      flash[:notice] = "Przedmiot został dodany do koszyka!"
    else
      cart_item.increment!(:count)
      flash[:notice] = "Przedmiot został dodany do koszyka!"
    end

    redirect_to :action => :Index
  end



  def subtract

    id = params[:id]
    find_cart()
    cart_item = @cart.cart_items.where(item_id: id).first
    cart_item.decrement!(:count)
    flash[:notice] = "Przedmiot został usunięty z koszyka!"

    redirect_to :action => :Index
  end

  def show

     find_cart

  end

  def update

  end

  def save

    id = params[:id]
    find_cart()
    @cart.user = current_user
    @cart.created_at = Time.now
    @cart.total = @cart.total_price
    @cart.state = 'oczekujące'
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

  private
  def find_item
    find_item
  end





end


