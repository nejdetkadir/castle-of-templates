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
      redirect_to liked_index_path
    else
      current_user.likeds.create(user: current_user, template: @template)
      redirect_to template_path(@template)
    end
  end
end
