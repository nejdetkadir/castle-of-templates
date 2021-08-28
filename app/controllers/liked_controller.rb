class LikedController < ApplicationController
  before_action :authenticate_user!

  include ApplicationHelper
  
  def index
    @likeds = current_user.likeds
  end

  def change_action
    @template = Template.find(params[:template_id])
    
    if check_like(current_user, @template)
      Liked.where(user: current_user, template: @template).first.destroy
      flash[:notice] = "Template was successfully removed from liked."
    else
      current_user.likeds.create(user: current_user, template: @template)
    end

    redirect_to request.referer
  end
end
