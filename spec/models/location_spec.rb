require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:jersey_city) { Location.create(name: 'Jersey City') }

    it 'City has a name' do
      expect(jersey_city.name).to eq('Jersey City')
    end
end
