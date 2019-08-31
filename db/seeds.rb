# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
	Scratcher.create({
		title: Faker::FunnyName.name,
		description: Faker::TvShows::RickAndMorty.quote,
		size: Faker::Name.initials,
		price: Faker::Number.decimal(l_digits: 2)
	})
end