# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'

puts 'Cleaning up database...'

UserInterest.destroy_all
Interest.destroy_all
UserAnswer.destroy_all
Answer.destroy_all
Question.destroy_all
Buddy.destroy_all
Project.destroy_all
User.destroy_all

puts 'Database cleaned!'

puts 'Creating interests...'

interests = %w[animation dancing singing writing cooking traveling crafts animals anime manga star\ wars harry\ potter shark\ week samurai martial\ arts programming history music fashion science astronomy yoga video\ games final\ fantasy spider-man kirby]

interests.each do |interest_name|
  Interest.create!(name: interest_name)
end

puts 'Creating buddies...'

kevin_buddy = Buddy.create!(
  name: 'dog',
  personality: 'friendly',
  love: 10
)

curtis_buddy = Buddy.create!(
  name: 'catfish',
  personality: 'shy',
  love: 10
)

juri_buddy = Buddy.create!(
  name: 'cat',
  personality: 'laid-back',
  love: 10
)

favi_buddy = Buddy.create!(
  name: 'bird',
  personality: 'energetic',
  love: 10
)

puts 'Buddies created!'

puts 'Creating users...'

kevin = User.create!(
  username: 'italian_beyonce',
  email: 'kevin@ontrack.com',
  password: 'buddy000',
  subject: 'Architecture',
  buddy: kevin_buddy,
  age: 21,
  grade: 'College Junior',
  learning_goal: 'vocabulary'
)
kevin_interest = Interest.create!(
  name: 'drawing'
)
UserInterest.create!(
  user: kevin,
  interest: kevin_interest
)

curtis = User.create!(
  username: 'american_gummi',
  email: 'curtis@ontrack.com',
  password: 'buddy000',
  subject: 'Computer Science',
  buddy: curtis_buddy,
  grade: 'college',
  learning_goal: 'admin'
)

juri = User.create!(
  username: 'japanese_onigiri',
  email: 'juri@ontrack.com',
  password: 'buddy000',
  subject: 'Design',
  buddy: juri_buddy,
  grade: 'college',
  learning_goal: 'historical figures'
)

favi = User.create!(
  username: 'spanish_tofu',
  email: 'favi@ontrack.com',
  password: 'buddy000',
  subject: 'Mathematics',
  buddy: favi_buddy,
  grade: 'college',
  learning_goal: 'rhythm'
)

puts 'Users created!'

puts 'Creating projects...'

# *****************KEVIN PROJECTS*****************
language_drawing = Project.create!(
  name: 'Learn Spanish by Drawing Animals',
  subject: 'Spanish',
  description: 'Welcome to our fun and engaging Spanish language learning experience, where we will dive into the world of animals and use drawing as a powerful tool to enhance your language skills! In this interactive and creative lesson, you will discover how drawing can be an exciting way to learn Spanish vocabulary and improve your communication skills.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :completed,
  points: 50,
  user: kevin,
  interest: 'drawing'
)
language_drawing_question = Question.create!(
  question_content: 'Can you mention three animals we drew today in Spanish?',
  project: language_drawing
)
Answer.create!(
  answer_content: 'Perro, Gato, Elephante',
  points: 5,
  question: language_drawing_question
)

language_drawing2 = Project.create!(
  name: 'Learn Spanish by Creating a Comic Book',
  subject: 'Spanish',
  description: 'Learn basic spanish verbs by creating a comic book! Choose a setting that appeals to you, choose your characters, and make a list of what their actions. Your goal is to use 5 - 10 action verbs in your comic strip.',
  deadline: DateTime.now,
  status: :pending,
  points: 40,
  user: kevin,
  interest: 'drawing'
)
language_drawing2_question = Question.create!(
  question_content: 'How do you say dance in spanish?',
  project: language_drawing2
)
Answer.create!(
  answer_content: 'bailar',
  points: 5,
  question: language_drawing2_question
)

architecture_harrypotter = Project.create!(
  name: 'Magical Architectural Wonders: Unveiling the Enchantment of Harry Potter-Inspired Architecture',
  subject: 'Architecture',
  description: 'Understand the influence of architecture in storytelling and fantasy literature. Recognize architectural elements inspired by the Harry Potter series. Explore the creative process of designing magical structures. Develop critical thinking skills by analyzing the connection between architecture and the world of Harry Potter.',
  deadline: DateTime.parse('2023-08-12 17:30:00'),
  status: :pending,
  points: 120,
  user: kevin,
  interest: 'harry potter'
)
architecture_harrypotter_question = Question.create!(
  question_content: 'What are some iconic locations from the Harry Potter series, and how does their architecture reflect the magical nature of the wizarding world?',
  project: architecture_harrypotter
)
Answer.create!(
  answer_content: 'Hogwarts Castle, Diagon Alley, and the Burrow',
  points: 20,
  question: architecture_harrypotter_question
)

architecture_animation = Project.create!(
  name: 'Animate Your Architectural Imagination: Exploring Architecture through Japanese Animation',
  subject: 'Architecture',
  description: 'Analyze the influence of architecture in Japanese animation. Recognize architectural elements and styles commonly depicted in anime. Understand the cultural significance of architecture in different anime settings. Apply architectural concepts to create a unique anime-inspired building design.',
  deadline: DateTime.parse('2023-08-12 17:30:00'),
  status: :pending,
  points: 110,
  user: kevin,
  interest: 'drawing'
)
architecture_animation_question = Question.create!(
  question_content: 'How does the integration of architecture and animation impact the overall artistry of anime?',
  project: architecture_animation
)
Answer.create!(
  answer_content: 'The integration of architecture and animation in anime creates a multi-layered visual experience.',
  points: 25,
  question: architecture_animation_question
)

architecture_drawing = Project.create!(
  name: 'Architectural Sketching: Bringing Buildings to Life',
  subject: 'Architecture',
  description: 'Understand the fundamental principles of architectural drawing. Develop skills in sketching various architectural elements. Apply artistic techniques to create expressive and detailed architectural drawings. Gain a deeper appreciation for the relationship between architecture and art.',
  deadline: DateTime.parse('2023-08-12 17:30:00'),
  status: :pending,
  points: 70,
  user: kevin,
  interest: 'drawing'
)
architecture_drawing_question = Question.create!(
  question_content: 'How does architectural sketching bridge the gap between architecture and art?',
  project: architecture_drawing
)
Answer.create!(
  answer_content: 'merging the technical aspects of design with artistic expression',
  points: 5,
  question: architecture_drawing_question
)

architecture_finalfantasy = Project.create!(
  name: 'Drawing Fantastical Architecture: Exploring Final Fantasy-Inspired Designs',
  subject: 'Architecture',
  description: 'Encourage creativity by having students design their own fantastical architectural structures inspired by the Final Fantasy universe.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :accepted,
  points: 30,
  user: kevin,
  interest: 'final fantasy'
)
architecture_finalfantasy_question = Question.create!(
  question_content: 'What are some iconic Final Fantasy architecture?',
  project: architecture_finalfantasy
)
Answer.create!(
  answer_content: 'Ul\'dah, Gridania, and Limsa Lominsa',
  points: 20,
  question: architecture_finalfantasy_question
)

# Project.create!(
#   name:
#   subject:
#   description:
#   deadline:
#   status:
#   points:
#   user:
#   interest:
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

language_starwars = Project.create!(
  name: 'A New Hope: Exploring Spanish Vocabulary Through Star Wars',
  subject: 'Spanish',
  description: 'The objective of this lesson is to introduce students to Spanish vocabulary by using terms and concepts from the Star Wars universe. Students will engage with popular Star Wars characters, settings, and phrases while expanding their language skills.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :pending,
  points: 200,
  user: kevin,
  interest: 'star wars'
)
language_starwars_question = Question.create!(
  question_content: 'What is the Spanish translation for "space" and "planet," two vocabulary words related to Star Wars?',
  project: language_starwars
)
Answer.create!(
  answer_content: 'espacio and planeta',
  points: 30,
  question: language_starwars_question
)

# *****************CURTIS PROJECTS*****************
coding = Project.create!(
  name: 'Learn Web Development With Ruby On Rails!',
  subject: 'Computer Science',
  description: 'In this engaging and hands-on lesson, students will be introduced to the world of web development using Ruby on Rails, a powerful and user-friendly web application framework. Through a step-by-step approach, students will gain a fundamental understanding of how to create dynamic and interactive web applications.',
  deadline: DateTime.now,
  status: :pending,
  points: 100,
  user: curtis,
  interest: 'programming'
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

culture_japanese = Project.create!(
  name: 'Anime Cuisine: A Culinary Journey through Japanese Animation',
  subject: 'Culture',
  description: 'The objective of this lesson is to introduce students to the delicious world of Japanese cuisine depicted in anime. Through cooking activities inspired by iconic anime dishes, students will learn about Japanese culture, traditional recipes, and the significance of food in storytelling.',
  deadline: DateTime.now,
  status: :accepted,
  points: 80,
  user: curtis,
  interest: 'cooking'
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

geography_kirby = Project.create!(
  name: 'Exploring Geography Through Kirby\'s Adventures',
  subject: 'Geography',
  description: 'The objective of this lesson is to engage students in learning geography concepts through the world of Kirby, a beloved video game character. By exploring various in-game environments, students will gain insights into geographical features, ecosystems, and their real-world counterparts.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :completed,
  points: 50,
  user: curtis,
  interest: 'kirby'
)
geography_kirby_question = Question.create!(
  question_content: 'In "Kirby and the Forgotten Land," Kirby explores a post-apocalyptic city. How might this virtual city help us learn about real-world urban environments?',
  project: geography_kirby
)
Answer.create!(
  answer_content: 'It shows us how cities can change over time due to various factors',
  points: 20,
  question: geography_kirby_question
)

# *****************JURI PROJECTS*****************
history_japanese = Project.create!(
  name: 'Exploring Japanese History through Interactive Timeline',
  subject: 'History',
  description: 'The objective of this lesson activity is to engage students in exploring key events and periods in Japanese history through an interactive timeline. By the end of the activity, students will have a better understanding of the significant milestones in Japan\'s rich historical past.',
  deadline: DateTime.now,
  status: :completed,
  points: 50,
  user: juri,
  interest: 'history'
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

design_fashion = Project.create!(
  name: 'Exploring Design through Fashion: Unleash Your Creative Style',
  subject: 'Design',
  description: 'The objective of this lesson is to introduce students to the world of design through the lens of fashion. Students will learn about the principles of design, color theory, and personal expression while creating their own fashion designs.',
  deadline: DateTime.parse('2023-08-07 14:30:00'),
  status: :pending,
  points: 60,
  user: juri,
  interest: 'fashion'
)
design_fashion_question = Question.create!(
  question_content: 'What are the fundamental elements of design and how do they apply to fashion?',
  project: design_fashion
)
Answer.create!(
  answer_content: 'line, shape, form, texture, and color',
  points: 10,
  question: design_fashion_question
)

design_samurai = Project.create!(
  name: 'Designing Samurai Aesthetics: Exploring Art and Culture',
  subject: 'Design',
  description: 'The objective of this lesson is to introduce students to the design principles and artistic aesthetics of samurai culture. Through this lesson, students will learn about the visual elements, symbolism, and historical significance of samurai design.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :accepted,
  points: 80,
  user: juri,
  interest: 'samurai'
)
design_samurai_question = Question.create!(
  question_content: 'What are some key design elements in samurai culture, and how do they contribute to the aesthetics of samurai armor and weaponry?',
  project: design_samurai
)
Answer.create!(
  answer_content: 'intricate patterns, symbolic motifs, and careful material selection',
  points: 25,
  question: design_samurai_question
)

# *****************FAVI PROJECTS*****************
math_music = Project.create!(
  name: 'Math in Music: Understanding Rhythms and Beats',
  subject: 'Mathematics',
  description: 'This lesson aims to introduce students to the mathematical concepts underlying musical rhythms and beats. By exploring the relationship between math and music, students can develop a deeper appreciation for both subjects.',
  deadline: DateTime.now,
  status: :accepted,
  points: 75,
  user: favi,
  interest: 'music'
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

history_spiderman = Project.create!(
  name: 'Unraveling History Through Spider-Man: Exploring Social and Cultural Contexts',
  subject: 'History',
  description: 'The objective of this lesson is to use Spider-Man as a lens to explore various historical periods and social contexts. Students will analyze how Spider-Man\'s character and stories reflect and respond to the cultural and historical issues of different eras.',
  deadline: DateTime.parse('2023-08-07 14:30:00'),
  status: :pending,
  points: 55,
  user: favi,
  interest: 'spider-man'
)
history_spiderman_question = Question.create!(
  question_content: 'How does Spider-Man\'s character and stories reflect the historical and social contexts of different eras?',
  project: history_spiderman
)
Answer.create!(
  answer_content: 'Spider-Man\'s struggles with responsibility and identity resonate with universal human experiences while also mirroring the challenges and values of the times in which they were written',
  points: 10,
  question: history_spiderman_question
)

math_sharkweek = Project.create!(
  name: 'Dive into Math with Sharks: Exploring Mathematical Concepts Through Shark Study',
  subject: 'Mathematics',
  description: 'The objective of this lesson is to engage students in mathematical concepts by using sharks as a real-world context. Students will apply various math skills to analyze data, make calculations, and solve problems related to shark characteristics and behaviors.',
  deadline: DateTime.parse('2023-08-07 14:30:00'),
  status: :completed,
  points: 100,
  user: favi,
  interest: 'shark week'
)
math_sharkweek_question = Question.create!(
  question_content: 'How does math help scientists learn about sharks and their behaviors?',
  project: math_sharkweek
)
Answer.create!(
  answer_content: 'figure out averages, make predictions, and understand patterns',
  points: 15,
  question: math_sharkweek_question
)

puts 'All finished!'

# Format for creating new projects to copy+paste

# Project.create!(
#   name:
#   subject:
#   description:
#   deadline:
#   status:
#   points:
#   user:
#   interest:
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
