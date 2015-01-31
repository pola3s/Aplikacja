class CartController < ApplicationController
  def Index
    @cart = session[:cart] ||= Hash.new(0)
  end

  def add
    id = params[:id]
    cart = session[:cart] ||= Hash.new(0)
    cart[id] = (cart[id] || 0) + 1
    redirect_to :action => :Index
  end
end


