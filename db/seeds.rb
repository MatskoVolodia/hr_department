# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email:      'admin@gmail.com',
  password:   '123123123',
  first_name: Faker::Name.first_name,
  last_name:  Faker::Name.last_name
)

10.times do
  UserGroup.create(group_name: Faker::StarWars.planet)
end

10.times do
  employee = Employee.create(
    email:      Faker::Internet.email,
    password:   '123123123',
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name
  )

  offsets = [rand(UserGroup.count), rand(UserGroup.count)].uniq

  offsets.each do |offset|
    employee.user_groups << UserGroup.offset(offset).first
  end
end

Post.skip_callback(:create, :after, :send_notifications)

10.times do
  post = Post.create(title: Faker::StarWars.call_sign, content: Faker::Lorem.paragraphs)

  offsets = [rand(UserGroup.count), rand(UserGroup.count)].uniq

  offsets.each do |offset|
    post.user_groups << UserGroup.offset(offset).first
  end
end

Post.set_callback(:create, :after, :send_notifications)
