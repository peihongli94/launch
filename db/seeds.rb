# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first_name: 'Pei', last_name: 'Li', email: 'peihongli94@gmail.com', account_id: "54f371c24463dfefac00014a")
commitment = Commitment.create(title: "Shave Pei's Head", description: "Pei will commit to shaving his head if he receives the desired sponsorship. All proceeds go to charity.", expiry_date: DateTime.now + 3.days, status: Commitment::PENDING, cost: 0.004, account_id: "54f3872a4463dfd5560001a2")
sponsorship = user.sponsorships.create(sponsorship_type: 'ownership', commitment_id: commitment.id)
