# frozen_string_literal: true 

class CategoriesController < ApplicationController
  def show
    @category = TemplateCategory.find(params[:id])

    unless @category
      redirect_to not_found_path
    end

    if params[:sort].eql?("most_popular")
      @templates = @category.templates.where(public: :true).order(download_count: :desc)
    elsif params[:sort].eql?("neweset")
      @templates = @category.templates.where(public: :true).order(created_at: :desc)
    else
      @templates = @category.templates.where(public: :true).order(created_at: :asc)
    end
  end
end
