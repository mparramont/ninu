class SearchController < ApplicationController
  ICONS = {
    'bus' => 'bus',
    'train' => 'train',
    'ship' => 'ship',
    'plane' => 'plane'
  }
  def index
    @results = Search.run!(params.permit!.to_h)
  end
end
