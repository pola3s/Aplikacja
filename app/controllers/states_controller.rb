class StatesController < InheritedResources::Base

  private

    def state_params
      params.require(:state).permit(:name)
    end
end

