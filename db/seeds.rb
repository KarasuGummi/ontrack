# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'

puts 'Cleaning up database...'

UserAnswer.destroy_all
Answer.destroy_all
Question.destroy_all
Buddy.destroy_all
Project.destroy_all
User.destroy_all

puts 'Database cleaned!'

puts 'Creating users...'

kevin = User.create!(
  username: 'italian_beyonce',
  email: 'kevin@ontrack.com',
  password: 'buddy000',
  interest: 'Language'
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
  status: :accepted,
  points: 50,
  user: kevin
)
spanish_art_question = Question.create!(
  question_content: 'Can you mention three animals we drew today in Spanish?',
  project: spanish_art
)
Answer.create!(
  answer_content: 'Perro, Gato, Elephante',
  points: 5,
  question: spanish_art_question
)

spanish_art2 = Project.create!(
  name: 'Learn Spanish by Creating a Comic Book',
  category: 'Language',
  description: 'Learn basic spanish verbs by creating a comic book! Choose a setting that appeals to you, choose your characters, and make a list of what their actions. Your goal is to use 5 - 10 action verbs in your comic strip.',
  deadline: DateTime.now,
  status: :pending,
  points: 40,
  user: kevin
)
spanish_art_2_question = Question.create!(
  question_content: 'How do you say dance in spanish?',
  project: spanish_art2
)
Answer.create!(
  answer_content: 'bailar',
  points: 5,
  question: spanish_art_2_question
)

coding = Project.create!(
  name: 'Learn Web Development With Ruby On Rails!',
  category: 'Computer Science',
  description: 'In this engaging and hands-on lesson, students will be introduced to the world of web development using Ruby on Rails, a powerful and user-friendly web application framework. Through a step-by-step approach, students will gain a fundamental understanding of how to create dynamic and interactive web applications.',
  deadline: DateTime.now,
  status: :pending,
  points: 100,
  user: curtis
)
coding_question = Question.create!(
  question_content: 'Does Yann look better with long or short hair?',
  project: coding
)
Answer.create!(
  answer_content: 'Yes',
  points: 5,
  question: coding_question
)

history_japanese = Project.create!(
  name: 'Exploring Japanese History through Interactive Timeline',
  category: 'History',
  description: 'The objective of this lesson activity is to engage students in exploring key events and periods in Japanese history through an interactive timeline. By the end of the activity, students will have a better understanding of the significant milestones in Japan\'s rich historical past.',
  deadline: DateTime.now,
  status: :completed,
  points: 50,
  user: juri
)
history_japanese_question = Question.create!(
  question_content: 'Which historical event on the Japanese history timeline led to the end of the samurai era and the beginning of the Meiji Restoration?',
  project: history_japanese
)
Answer.create!(
  answer_content: 'The overthrow of the Tokugawa Shogunate in 1868',
  points: 15,
  question: history_japanese_question
)

culture_japanese = Project.create!(
  name: 'Anime Cuisine: A Culinary Journey through Japanese Animation',
  category: 'Culture',
  description: 'The objective of this lesson is to introduce students to the delicious world of Japanese cuisine depicted in anime. Through cooking activities inspired by iconic anime dishes, students will learn about Japanese culture, traditional recipes, and the significance of food in storytelling.',
  deadline: DateTime.now,
  status: :pending,
  points: 80,
  user: curtis
)
culture_japanese_question = Question.create!(
  question_content: 'In the anime "Spirited Away," what is the significance of the bento box that Chihiro\'s parents eat?',
  project: culture_japanese
)
Answer.create!(
  answer_content: 'It represents their lack of awareness and respect for the spirit world.',
  points: 10,
  question: culture_japanese_question
)

math_music = Project.create!(
  name: 'Math in Music: Understanding Rhythms and Beats',
  category: 'Mathematics',
  description: 'This lesson aims to introduce students to the mathematical concepts underlying musical rhythms and beats. By exploring the relationship between math and music, students can develop a deeper appreciation for both subjects.',
  deadline: DateTime.now,
  status: :accepted,
  points: 75,
  user: favi
)
math_music_question = Question.create!(
  question_content: 'How do musicians use fractions in musical notation to represent different note durations?',
  project: math_music
)
Answer.create!(
  answer_content: 'Each musical note is assigned a specific fraction of a whole note.',
  points: 20,
  question: math_music_question
)

puts 'All finished!'

# Format for creating new projects to copy+paste

# Project.create!(
#   name:
#   category:
#   description:
#   deadline:
#   status:
#   points:
#   user:
# )
# Question.create!(
#   question_content:
#   project:
# )
# Answer.create!(
#   answer_content:
#   points:
#   question:
# )
