class TemplatesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :explore]
  before_action :set_template, only: [:edit, :update, :show, :destroy]

  include ApplicationHelper

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    @template.user = current_user
    
    if @template.save
      redirect_to template_path(@template)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if check_current_user(@template.user)
      if @template.update(template_params)
        flash[:notice] = "Template was successfully updated."
        redirect_to template_path(@template)
      else
        render :edit
      end
    else
      redirect_to not_found_path
    end
  end

  def destroy
    if check_current_user(@template.user)
      @template.destroy
      flash[:notice] = "Template was successfully destroyed."
      redirect_to root_path 
    else
      redirect_to not_found_path
    end
  end

  private
  
  def template_params
    params.require(:template).permit(:name, :icon, :description, :instructions, :script, :public)
  end

  def set_template
    @template = Template.find(params[:id])
    redirect_to not_found_path unless @template
  end
end
