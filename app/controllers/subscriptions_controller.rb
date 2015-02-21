class SubscriptionsController < InheritedResources::Base


  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
    end







  def new
    @subscription = Subscription.new
  end

  def create

  end

  def show
    find_subscription
  end

  def update

  end

  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  private
  def subscription_params
    params.require(:subscription).permit(:name, :description, :price, :subscription_item )
  end



end

