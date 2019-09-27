# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search' do
  subject { Search.run!(params)}
  let(:params) do
    {
      latitude: '41.390205',
      longitude: '2.154007',
      budget: 500,
      start_date: Date.today + 5.days,
      end_date: Date.today + 7.days
    }
  end

  it "" do
    ap subject
  end
end
