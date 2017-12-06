# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Reservation.destroy_all
Item.destroy_all
User.destroy_all
Location.destroy_all

manhattan = Location.create(name: "Manhattan")
brooklyn = Location.create(name: "Brooklyn")
queens = Location.create(name: "Queens")
bronx = Location.create(name: "Bronx")
staten_island = Location.create(name: "Staten Island")

george = User.create(name: "George", email: "george@george.com", password: "george", location: brooklyn)
dan = User.create(name: "Dan", email: "dan@dan.com", password: "dandan", location: queens)
paul = User.create(name: "Paul", email: "paul@paul.com", password: "paulpaul", location: manhattan)

hammer = ToolType.create(name: "Hammer")
drill = ToolType.create(name: "Drill")
vicegrip = ToolType.create(name: "Vicegrip")
saw = ToolType.create(name: "Saw")
toolkit = ToolType.create(name: "Toolkit")
ladder = ToolType.create(name: "Ladder")
sander  = ToolType.create(name: "Sander")
nailgun = ToolType.create(name: "Nailgun")


hammer1 = Item.create(name: '20 oz. Straight-Claw Rip Hammer', brand: 'Estwing', cost_daily: 5.0, cost_hourly: 1.0, available: true, location: brooklyn, tool_type: hammer)
hammer2 = Item.create(name: '16 oz. Balpene Hammer', brand: 'Cobalt', cost_daily: 4.0, cost_hourly: 1.0, available: true, location: queens, tool_type: hammer)
drill1 = Item.create(name: 'GCO1200C 12-Volt Cordless Drill with Over Molds, Orange and Black', brand: 'Estwing', cost_daily: 5.99, cost_hourly: 1.99, available: true, location: manhattan, tool_type: drill)
drill2 = Item.create(name: 'CT226 12V Max CXT Lithium-Ion Cordless Combo Kit, (2 Piece)', brand: 'Black & Decker', cost_daily: 13.45, cost_hourly: 4.60, available: true, location: staten_island, tool_type: drill)
vicegrip1 = Item.create(name: 'CLP5SETN Locking Plier Set, 5 Piece', brand: 'Crescent', cost_daily: 11.0, cost_hourly: 3.20, available: true, location: brooklyn, tool_type: vicegrip)
vicegrip2 = Item.create(name: 'Locking Pliers, Original, Long Nose, 6-Inch (1402L3)', brand: 'ERWIN', cost_daily: 6.0, cost_hourly: 1.50, available: true, location: bronx, tool_type: vicegrip)
saw1 = Item.create(name: '15-Inch 12-Point/Inch SharpTooth Handsaw', brand: 'Stanley', cost_daily: 7.0, cost_hourly: 2.0, available: true, location: brooklyn, tool_type: saw)
saw2 = Item.create(name: '15-Amp 7-1/4-Inch Circular Saw with Single Beam Laser Guide', brand: 'SKIL', cost_daily: 8.0, cost_hourly: 1.25, available: true, location: queens, tool_type: saw)
toolkit1 = Item.create(name: '94-248 65-Piece Homeowner\'s Tool Kit', brand: 'Stanley', cost_daily: 9.0, cost_hourly: 1.50, available: true, location: manhattan, tool_type: toolkit)
tookit2 = Item.create(name: '39-Piece Tool Set - General Household Hand Tool Kit', brand: 'Cartman', cost_daily: 5.25, cost_hourly: 0.75, available: true, location: queens, tool_type: toolkit)
ladder1 = Item.create(name: '300-Pound Duty Rating 6-foot Stepladder with Platform', brand: 'Flip-N-Lite', cost_daily: 9.70, cost_hourly: 2.50, available: true, location: brooklyn, tool_type: ladder)
ladder2 = Item.create(name: '17-Foot Velocity Multi-Use Ladder, 300-Pound Duty Rating', brand: 'Little Giant', cost_daily: 16.85, cost_hourly: 4.50, available: true, location: queens, tool_type: ladder)
sander1 = Item.create(name: 'ROS20VSC Random Orbit Sander with Carrying Bag, 5-Inch, Blue', brand: 'Bosh', cost_daily: 14.75, cost_hourly: 3.50, available: true, location: brooklyn, tool_type: sander)
sander2 = Item.create(name: '2 in 1 Sheet & Detail Sander 1.1A', brand: 'VonHaus', cost_daily: 8.33, cost_hourly: 1.25, available: true, location: bronx, tool_type: sander)
nailgun1 = Item.create(name: 'SFN64 Straight Finish Nailer 16 Gauge', brand: 'Numax', cost_daily: 30.0, cost_hourly: 10.0, available: true, location: staten_island, tool_type: nailgun)
nailgun2 = Item.create(name: 'P320 Airstrike 18 Volt One+ Lithium Ion Cordless Brad Nailer', brand: 'Ryobi', cost_daily: 40.0, cost_hourly: 11.25, available: true, location: queens, tool_type: nailgun)


res1 = Reservation.create(user: george, item: hammer1, start_date: 'Mon, 04 Dec 2017 00:00:00 -0500', end_date:'Tues, 05 Dec 2017 00:00:00 -0500', total_cost: 5.0)
res2 = Reservation.create(user: dan, item: hammer2, start_date: 'Sun, 03 Dec 2017 00:00:00 -0500', end_date:'Wed, 06 Dec 2017 00:00:00 -0500', total_cost: 5.0)

rev1 = Review.create(reservation: res1, content: "It worked!", rating: 7)
