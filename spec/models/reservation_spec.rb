require 'rails_helper'

RSpec.describe Reservation, type: :model do

    let(:jersey_city) { Location.create(name: 'Jersey City') }

    let(:user1) { User.create(name: 'Marc', email: 'marc@marc.com', password: "marcmarc", location: jersey_city) }

    let(:chainsaw) { ToolType.create(name: 'Chainsaw') }

    let(:item1) { Item.create(name: '17 Foot Long Chainsaw', brand: "Big Chainsaw Company", cost_daily: 55.0, cost_hourly: 10.0, location: jersey_city, available: true, tool_type: chainsaw) }

    let(:item2) { Item.create(name: '14 Foot Long Chainsaw', brand: "Medium Chainsaw Company", cost_daily: 25.0, cost_hourly: 5.0, location: jersey_city, available: true, tool_type: chainsaw) }

    let!(:res1) { Reservation.create(user: user1, item: item1, start_date: Time.now, end_date: '2017-12-07 22:06:11 +0000', total_cost: 55.0) }

    let!(:res2) { Reservation.create(user: user1, item: item2, start_date: Time.now, end_date: '2017-12-07 22:06:11 +0000', total_cost: 25.0)}

    let!(:res3) { Reservation.create(user: user1, item: item1, start_date: '2017-12-08 22:06:11 +0000', end_date: '2017-12-09 22:06:11 +0000', total_cost: 25.0)}

    let!(:rev1) { Review.create(reservation: res1, content: "So Goooooood", rating: 8) }

    let!(:rev2) { Review.create(reservation: res2, content: "Meh", rating: 2) }



    it 'Reservation has a user' do
      expect(res1.user).to eq(user1)
    end

    it 'Reservation has an item' do
      expect(res1.item).to eq(item1)
    end

    it 'Reservation has many reviews' do
      expect(res1.reviews).to include(rev1)
    end

    it 'Reservation has a location though item' do
      expect(res1.item.location).to eq(jersey_city)
    end

    it 'Reservation has a tool_type though item' do
      expect(res1.item.tool_type).to eq(chainsaw)
    end

end
