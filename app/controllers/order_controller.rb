class OrderController < ApplicationController
  before_filter :authenticate_user!



  def index
    find_order
  end

  def new
    @order = Order.new
  end

  def add

    id = params[:id]
    find_order()
    order_subscription = @order.order_subscriptions.where(order_id: id).first
    if order_subscription.nil?
      subscription = Subscription.find(id)
      order_subscription = OrderSubscription.create(list: @order, subscription: subscription,count: 1)
      flash[:notice] = "Przedmiot został dodany do koszyka!"
    else
      order_subscription.increment!(:count)
      flash[:notice] = "Przedmiot został dodany do koszyka!"
    end

    redirect_to :action => :index
  end

  def show
    find_order
  end

  def pay
    find_order
  end
  def save

    id = params[:id]
    find_order()
    @order.user = current_user
    @order.created_at = Time.now
    @order.total = @order.total_price
    @order.save

    session.delete(:order_id)
    flash[:notice] = "Twoje zamówienie zostało przyjęte do realizacji!"
    redirect_to "/"



  end

  private
  def find_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
  end

  private
  def order_params
    params.require(
        :l
    ).permit(
        :total
    )
  end


end