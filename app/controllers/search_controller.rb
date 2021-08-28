# frozen_string_literal: true 

class SearchController < ApplicationController
  def show
    @q = Template.ransack(params[:q])
    @result = @q.result
  end
end
