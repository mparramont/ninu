class SearchController < ApplicationController
  ICONS = {
    'bus' => 'bus',
    'train' => 'train',
    'ship' => 'ship',
    'plane' => 'plane'
  }

  TYPE_COLOR = {
    'Chill' => '#4BA97A',
    'Historical' => '#D66C34',
    'Adventure' => '#D6347A',
    'Romantic' => '#B134D6',
    'Foodie' => '#F9971E',
    'Party' => '#E30707',
  }

  def index
    @results = Search.run!(params.permit!.to_h)
  end


end
