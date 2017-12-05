# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
User.destroy_all
Item.destroy_all
Reservation.destroy_all
Review.destroy_all

manhattan = Location.create(name: "Manhattan")
brooklyn = Location.create(name: "Brooklyn")
queens = Location.create(name: "Queens")
bronx = Location.create(name: "Bronx")
staten_island = Location.create(name: "Staten Island")

george = User.create(name: "George", email: "george@george.com", password: "george", location: brooklyn)

hammer = ToolType.create(name: "Hammer")

hammer1 = Item.create(name: '20 oz. Straight-Claw Rip Hammer', brand: 'Estwing', cost_daily: 5.0, cost_hourly: 1.0, available: true, location: brooklyn, tool_type: hammer)

res1 = Reservation.create(user: george, item: hammer1, start_date: 'Mon, 04 Dec 2017 00:00:00 -0500', end_date:'Tues, 05 Dec 2017 00:00:00 -0500', total_cost: 5.0)

rev1 = Review.create(reservation: rev1, content: "It worked!", rating: 7)
