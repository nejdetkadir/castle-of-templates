class TemplatesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :explore]
  before_action :set_template, only: [:edit, :update, :show, :destroy]

  include ApplicationHelper

  def new
    @template = Template.new
    @template_categories = TemplateCategory.where(public: :true)
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
  
  def index
    @templates = current_user.templates
  end
  
  def explore
    if params[:sort].eql?("most_popular")
      @templates = Template.active.order(created_at: :desc)
    elsif params[:sort].eql?("neweset")
      @templates = Template.active.order(created_at: :desc)
    else
      @templates = Template.active.order(created_at: :asc)
    end
  end

  def edit
    @template_categories = TemplateCategory.where(public: :true)
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
      redirect_to templates_path 
    else
      redirect_to not_found_path
    end
  end

  private
  
  def template_params
    params.require(:template).permit(:name, :icon, :description, :instructions, :script, :public, :template_category_id)
  end

  def set_template
    @template = Template.find(params[:id])
    redirect_to not_found_path unless @template
  end
end
