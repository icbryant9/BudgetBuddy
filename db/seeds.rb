# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
u1 = User.create!(
  email: 'alice@gmail.com',
  password: 'password'
)

u2 = User.create!(
  email: 'bob@gmail.com',
  password: 'password'
)
u3 = User.create!(
  email: 'tom@email.com',
  password: 'password'
)
u4 = User.create!(
  email: 'alice@email.com',
  password: 'password'
)
u5 = User.create!(
  email: 'bob@email.com',
  password: 'password'
)

# Goals
g1 = Goal.create!(
  user: u1,
  title: 'New Car',
  progress: 10000,
  goal: 18000
)

g2 = Goal.create!(
  user: u1,
  title: 'Computer',
  progress: 300,
  goal: 3000
) 

g3 = Goal.create!(
  user: u1,
  title: '6 Month Savings',
  progress: 12000,
  goal: 12000
)

g4 = Goal.create!(
  user: u2,
  title: 'Student Loans',
  progress: 5000,
  goal: 22000
)

g5 = Goal.create!(
  user: u2,
  title: 'Savings',
  progress: 2000,
  goal: 10000
)

#followings

f1 = Following.create!(
  user: u1,
  requester_user_id: 1,
  following_user_id: 2


)