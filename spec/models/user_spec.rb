require 'rails_helper'

RSpec.describe User, type: :model do

    let(:jersey_city) { Location.create(name: 'Jersey City') }

    let(:user1) { User.create(name: 'Marc', email: 'marc@marc.com', password: "marcmarc", location: jersey_city) }

    let(:chainsaw) { ToolType.create(name: 'Chainsaw') }

    let(:item1) { Item.create(name: '17 Foot Long Chainsaw', brand: "Big Chainsaw Company", cost_daily: 55.0, cost_hourly: 10.0, location: jersey_city, available: true, tool_type: chainsaw) }

    let(:item2) { Item.create(name: '14 Foot Long Chainsaw', brand: "Medium Chainsaw Company", cost_daily: 25.0, cost_hourly: 5.0, location: jersey_city, available: true, tool_type: chainsaw) }

    let!(:res1) { Reservation.create(user: user1, item: item1, start_date: Time.now, end_date: '2017-12-07 22:06:11 +0000', total_cost: 55.0) }

    let!(:res2) { Reservation.create(user: user1, item: item2, start_date: Time.now, end_date: '2017-12-07 22:06:11 +0000', total_cost: 25.0)}

    let!(:rev1) { Review.create(reservation: res1, content: "So Goooooood", rating: 8) }

    let!(:rev2) { Review.create(reservation: res2, content: "Meh", rating: 2) }


    it 'User has a name' do
      expect(user1.name).to eq('Marc')
    end

    it 'User has an email address' do
      expect(user1.email).to eq('marc@marc.com')
    end


    it 'User has_many reservations' do
      expect(user1.reservations).to include(res1)
    end

    it 'User has_many reviews through reservations' do
      expect(user1.reservations.first.reviews).to include(rev1)
    end
end
