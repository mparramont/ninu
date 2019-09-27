# frozen_string_literal: true

class Search < Mutations::Command
  optional do
    float :latitude
    float :longitude
    integer :budget
    date :start_date
    date :end_date
    # string :type
    # string :location
  end

  def execute
    search_results
  end

  private

  def search_results
    locations = fetch_locations
    locations.map do |location|
      search_to_location(location)
    end
  end

  def fetch_locations
    # TODO use Location AP
    %w[reus tarragona girona cervera cadaqués]
  end

  def search_to_location(location)
    # todo use Search API
    {
      'result' => location
    }
  end
end
