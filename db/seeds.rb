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
    name: Faker::Pokemon.name
  ).save!
end

10.times do
  begin
    e = Event.new(
      name: Faker::Superhero.descriptor,
      price: rand(12..30),
      place: rand(100..500),
      date: Faker::Date.between(2.days.ago, Date.today),
      description: Faker::Lorem.paragraph,
      user_id: User.all.sample.id,
      category: Category.all.sample,
      address: Faker::Address.city,
      infos: Faker::Lorem.paragraphs
    )
    e.picture_url = "http://lorempixel.com/280/310/"
    e.geocode
    e.save
  rescue
  end
end

20.times do
  Booking.new(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id,
    place: rand(1..3)
  ).save
end
