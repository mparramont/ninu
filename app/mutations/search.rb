# frozen_string_literal: true

class Search < Mutations::Command
  optional do
    float :latitude, empty: true, nils: true
    float :longitude, empty: true, nils: true
    integer :budget, empty: true, nils: true
    date :start_date, empty: true, nils: true
    date :end_date, empty: true, nils: true
    # string :type, empty: true, nils: true
    # string :location, empty: true, nils: true
  end

  def execute
    results = HTTParty.get("https://kiwicom-prod.apigee.net/locations/radius?apikey=#{ENV["KIWI_API_KEY"]}&term=BCN&radius=250&locale=en-US&location_types=airport&limit=20&active_only=true")

    results["locations"].map do |l|
      {
        place: l["name"],
        type: 'chill',
        img: 'https://user-images.githubusercontent.com/1333174/65799970-a6f4e000-e175-11e9-8b3a-7c286049aadb.png',
        options: [
          { type: 'bus', price: price, co2: 10 },
          { type: 'train', price: price, co2: 10 },
          { type: 'plane', price: price, co2: 10 }
        ]
      }
    end

    #     place: 'Girona',
    #     img: 'https://user-images.githubusercontent.com/1333174/65799970-a6f4e000-e175-11e9-8b3a-7c286049aadb.png',

    #     place: 'Zaragoza',
    #     img: 'https://user-images.githubusercontent.com/1333174/65800115-f4714d00-e175-11e9-99ae-a70d161fb990.png',

    #     place: 'Carcassone',
    #     img: 'https://user-images.githubusercontent.com/1333174/65800304-66e22d00-e176-11e9-98ae-2941f405e23c.png',

    #     place: 'Mallorca',
    #     img: 'https://user-images.githubusercontent.com/1333174/65800428-c5a7a680-e176-11e9-8beb-abcb3925ab90.png',

    # search_results
  end

  private

  def price
    budget - rand(5) * 10
  end

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
