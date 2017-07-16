# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  { first_name: 'Anna', last_name: 'Yazmin', email: 'annabel.yazmin@gmail.com', password: 'abcd1234', gender: 'female', birth_year: 1981, biography: 'Hi I am Anna', photo: 'default' },
  { first_name: 'Hope', last_name: 'Bitz', email: 'hoeblitz@gmail.com', password: 'abcd1234', gender: 'female', birth_year: 1994, biography: 'Hi I am Anna', photo: 'default' },
  { first_name: 'Jane', last_name: 'Doe', email: 'janedoe@mail.com', password: 'abcd1234', gender: 'female', birth_year: 1992, biography: 'Hi I am jane', photo: 'default' },
  { first_name: 'John', last_name: 'Doe', email: 'johndoe@mail.com', password: 'abcd1234', gender: 'male', birth_year: 1990, biography: 'Hi I am john', photo: 'default' },
])

tags = Tag.create([
  { name: 'undergraduate'},
  { name: 'graduate school'},
  { name: 'phd'},
  { name: 'major (undergraduate)'},
  { name: 'studying computer science'},
  { name: 'mentorship'},
  { name: 'applying to internships'},
  { name: 'internships'},
  { name: 'applying to undergrad'},
  { name: 'product management'},
  { name: 'racism'},
  { name: 'sexism'},
  { name: 'homophobia'},
  { name: 'transphobia'},
  { name: 'interviews'},
  { name: 'work-life balance'},
  { name: 'applying to jobs'},
  { name: 'career advice'},
  { name: 'imposter syndrome'},
  { name: 'java'},
  { name: 'css'},
  { name: 'python'},
  { name: 'user interface'},
  { name: 'textbooks'},
  { name: 'community college'},
  { name: 'scala'},
  { name: 'ruby'},
  { name: 'ruby on rails'},
  { name: 'exchange trips'},
  { name: 'career advancement'},
  { name: 'promotions'},
  { name: 'salary negotiation'},
  { name: 'housing'},
  { name: 'job interview'},
  { name: 'code2040'},
  { name: 'return offer'},
  { name: 'stanford university'},
  { name: 'brooklyn college'},
  { name: 'mills college'},
  { name: 'career goals'},
  { name: 'harvard'},
  { name: 'harvey mudd'},
  { name: 'communication with manager'},
  { name: 'cowerkers'},
  { name: 'public speaking'},
  { name: 'substance abuse'},
  { name: 'stress management'},
  { name: 'mental health'},
  { name: 'financial advice'},
  { name: 'startup'},
  { name: 'entrepreneurship'},
  { name: 'resume'},
  { name: 'peer'},
  { name: 'coach'},
  { name: 'sponsor'},
  { name: 'hiring'}
])

User.all.first.user_interests.create([
  {tag_id: 2},  {tag_id: 12},  {tag_id: 22},  {tag_id: 32},  {tag_id: 42}
])
User.all.first.user_specialties.create([
  {tag_id: 3},  {tag_id: 13},  {tag_id: 23},  {tag_id: 33},  {tag_id: 43}
])

User.all.second.user_interests.create([
  {tag_id: 3},  {tag_id: 13},  {tag_id: 23},  {tag_id: 33},  {tag_id: 43}
])
User.all.second.user_specialties.create([
  {tag_id: 2},  {tag_id: 12},  {tag_id: 22},  {tag_id: 32},  {tag_id: 42}
])

User.all.third.user_interests.create([
  {tag_id: 3},  {tag_id: 12},  {tag_id: 53},  {tag_id: 16},  {tag_id: 43}
])
User.all.third.user_specialties.create([
  {tag_id: 2},  {tag_id: 22},  {tag_id: 33},  {tag_id: 44},  {tag_id: 42}
])
