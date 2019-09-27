class SearchController < ApplicationController
  def index
    @results = Search.run!(params.permit!.to_h)
  end
end
