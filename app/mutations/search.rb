# frozen_string_literal: true

class Search < Mutations::Command
  optional do
    float :latitude
    float :longitude
    string :location
    integer :budget
    string :type
    date :start_date
    date :end_date
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
    %w[reus tarragona girona cervera cadaqués]
  end

  def search_to_location(location)
    {
      'result' => location
    }
  end
end
