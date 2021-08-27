class TemplatesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :explore]
  before_action :set_template, only: [:edit, :update, :show, :destroy]

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    @template.user = current_user

    if @template.save
      redirect_to @template
    else
      render :new
    end
  end

  def show
  end

  def explore
    @templates = Template.all
  end

  def edit
  end

  def update
    if @template.update(template_params)
      redirect_to @template
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    flash[:notice] = "Template was successfully destroyed."
    redirect_to root_path
  end

  private
  
  def template_params
    params.require(:template).permit(:name, :icon, :description, :instructions, :script, :public)
  end

  def set_template
    @template = Template.find(params[:id])
  end
end
