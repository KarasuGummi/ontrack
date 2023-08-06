# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'

puts 'Cleaning up database...'

User.destroy_all
Buddy.destroy_all
Project.destroy_all
Question.destroy_all
Answer.destroy_all
UserAnswer.destroy_all

puts 'Database cleaned!'

puts 'Creating users...'

kevin = User.create!(
  username: 'italian_beyonce',
  email: 'kevin@ontrack.com',
  password: 'buddy000'
)

curtis = User.create!(
  username: 'american_gummi',
  email: 'curtis@ontrack.com',
  password: 'buddy000'
)

juri = User.create!(
  username: 'japanese_onigiri',
  email: 'juri@ontrack.com',
  password: 'buddy000'
)

favi = User.create!(
  username: 'spanish_tofu',
  email: 'favi@ontrack.com',
  password: 'buddy000'
)

puts 'Users created!'
puts 'Creating buddies...'

Buddy.create!(
  name: 'dog',
  personality: 'friendly',
  love: 10,
  user: kevin
)

Buddy.create!(
  name: 'dog',
  personality: 'shy',
  love: 10,
  user: curtis
)

Buddy.create!(
  name: 'dog',
  personality: 'laid-back',
  love: 10,
  user: juri
)

Buddy.create!(
  name: 'dog',
  personality: 'energetic',
  love: 10,
  user: favi
)

puts 'Buddies created!'
puts 'Creating projects...'

spanish_art = Project.create!(
  name: 'Learn Spanish by Drawing Animals',
  category: 'Language',
  description: 'Welcome to our fun and engaging Spanish language learning experience, where we will dive into the world of animals and use drawing as a powerful tool to enhance your language skills! In this interactive and creative lesson, you will discover how drawing can be an exciting way to learn Spanish vocabulary and improve your communication skills.',
  deadline: DateTime.now,
  status: false,
  points: 50,
  user: kevin
)

spanish_art_question = Question.create!(
  question_content: 'Can you mention three animals we drew today in Spanish?',
  project: spanish_art
)

Answer.create!(
  answer_content: 'Perro, Gato, Elephante',
  question: spanish_art_question,
  points: 5
)

coding = Project.create!(
  name: 'Learn Web Development With Ruby On Rails!',
  category: 'computer science',
  description: 'In this engaging and hands-on lesson, students will be introduced to the world of web development using Ruby on Rails, a powerful and user-friendly web application framework. Through a step-by-step approach, students will gain a fundamental understanding of how to create dynamic and interactive web applications.',
  deadline: DateTime.now,
  status: true,
  points: 100,
  user: curtis
)

coding_question = Question.create!(
  question_content: 'placeholder question',
  project: coding
)

Answer.create!(
  answer_content: 'placeholder answer',
  question: coding_question,
  points: 5
)

puts 'All finished!'
