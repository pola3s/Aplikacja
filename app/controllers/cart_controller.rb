class CartController < ApplicationController
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

  def show
     find_cart
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

end


