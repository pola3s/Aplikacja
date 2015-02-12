class RolesController < InheritedResources::Base
  before_filter :authenticate_user!

  private

    def role_params
      params.require(:role).permit(:name, :description)
    end
end

