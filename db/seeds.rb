Booking.destroy_all
Category.destroy_all
Event.destroy_all
User.destroy_all

20.times do
  User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    password: "air-event",
    last_name: Faker::Name.last_name
  ).save!
end

10.times do
Category.new(
  name: Faker::Pokemon.name).save!
end

5.times do
  Event.new(
    name: Faker::Superhero.descriptor,
    address: Faker::Address.street_address,
    price: rand(1..20),
    place: rand(1..20),
    date: Faker::Date.between(2.days.ago, Date.today),
    description: Faker::Lorem.paragraph,
    user_id: User.all.sample.id,
    category: Category.all.sample
  ).save!
end

10.times do
  Booking.new(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id
    ).save!
end
