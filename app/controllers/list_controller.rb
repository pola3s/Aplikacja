class ListController < ApplicationController
  before_filter :authenticate_user!



  def Index
    find_list()
  end

  def new
    @list = List.new
  end

  def create

  end

  def add
    id = params[:id]
    find_list()
    list_sub = @list.list_subs.where(sub_id: id).first
    if list_sub.nil?
      sub = Sub.find(id)
      list_sub = ListSub.create(list: @list, sub: sub,count: 1)
      flash[:notice] = "Przedmiot został dodany do koszyka!"
    else
      list_sub.increment!(:count)
      flash[:notice] = "Przedmiot został dodany do koszyka!"
    end

    redirect_to :action => :index
  end





  def show

    find_list

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
  def find_list
    if session[:list_id]
      @list = List.find(session[:list_id])
    else
      @list = List.create
      session[:list_id] = @list.id
    end
  end

  private
  def list_params
    params.require(
        :clist
    ).permit(
        :total
    )
  end

  private
  def find_sub
    find_sub
  end





end


