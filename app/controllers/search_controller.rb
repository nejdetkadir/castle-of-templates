# frozen_string_literal: true 

class SearchController < ApplicationController
  def show
    @result = Template.search params[:q], fields: [:name, :description], where: {public: true}
  end
end
