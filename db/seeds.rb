# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'
require 'open-uri'

puts 'Cleaning up database...'

Chatroom.destroy_all
Message.destroy_all
UserInterest.destroy_all
Interest.destroy_all
UserAnswer.destroy_all
Answer.destroy_all
Question.destroy_all
User.destroy_all
Buddy.destroy_all
Project.destroy_all

puts 'Database cleaned!'
puts User.count

puts 'Creating interests...'

interests = %w[animation dancing singing writing cooking traveling crafts animals anime manga star\ wars harry\ potter shark\ week samurai martial\ arts programming history music fashion science astronomy yoga video\ games final\ fantasy spider-man kirby]

interests.each do |interest_name|
  Interest.create!(name: interest_name)
end

puts 'Creating buddies...'

kevin_buddy = Buddy.create!(
  name: 'Pochi',
  personality: 'friendly',
  love: 0
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
  username: 'Kevin',
  email: 'kevin@ontrack.com',
  password: 'buddy000',
  subject: 'Spanish',
  buddy: kevin_buddy,
  grade: 'College Junior',
  learning_goal: 'Basic Vocabulary',
  age: 21,
  points: 0
)

kevin_profile_img = URI.open('https://res.cloudinary.com/du53mgiot/image/upload/v1692580133/gi4y7v0luoez7fb6mgz0.jpg')
kevin.photo.attach(io: kevin_profile_img, filename: 'kevin_profile.jpg', content_type: 'image/png')

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

# Recommended Project 1
frontend_design_animals = Project.create!(
  name: 'Animal-Themed Web Design: Using HTML and CSS',
  subject: 'Front-End Design',
  description: 'Dive into the fascinating world of animals while designing a responsive webpage using HTML and CSS. Utilize various styling techniques to create visually appealing layouts featuring your favorite animals.',
  deadline: DateTime.now + 2.weeks,
  status: :pending,
  points: 10,
  user: kevin,
  interest: 'animals',
  learning_goal: 'HTML and CSS',
  steps: ['Step 1: Choose an animal theme.', 'Step 2: Draft a layout design.', 'Step 3: Code the basic structure using HTML.', 'Step 4: Style with CSS.', 'Step 5: Review and refine your webpage.'],
  vocab_words: ['container', 'selector', 'property', 'value', 'responsive']
)
frontend_design_animals_question = Question.create!(
  question_content: 'What is the div tag used for?',
  project: frontend_design_animals
)
Answer.create!(
  answer_content: 'The div tag defines a division or a section in an HTML document.',
  points: 5,
  question: frontend_design_animals_question
)

# Recommended Project 2
javascript_stimulus = Project.create!(
  name: 'Interactive Web with Stimulus: A Programming Adventure',
  subject: 'JavaScript',
  description: 'Enhance your JavaScript skills by diving into Stimulus, a modular framework that simplifies complex interactions. Use Stimulus to add interactivity and enhance user experience on your web applications.',
  deadline: DateTime.now + 2.weeks,
  status: :pending,
  points: 10,
  user: kevin,
  interest: 'programming',
  learning_goal: 'Stimulus',
  steps: ['Step 1: Setup a basic JavaScript project.', 'Step 2: Integrate the Stimulus framework.', 'Step 3: Identify the interactive elements.', 'Step 4: Write Stimulus controllers.', 'Step 5: Test and refine your interactions.'],
  vocab_words: ['controller', 'target', 'action', 'hook', 'data-map']
)

javascript_stimulus_question = Question.create!(
  question_content: 'What is the equivalent of a stimulus data target in JavaScript?',
  project: javascript_stimulus
)
Answer.create!(
  answer_content: 'The data target serves a function similar to a querySelector.',
  points: 5,
  question: javascript_stimulus_question
)

# Recommended Project 3
german_dancing = Project.create!(
  name: 'Dance to German Verbs: Moving with Language',
  subject: 'German',
  description: 'Combine your passion for dancing with learning German. Discover basic German action verbs, incorporate them into your dance routines, and have fun while mastering a new language.',
  deadline: DateTime.now + 2.weeks,
  status: :pending,
  points: 10,
  user: kevin,
  interest: 'dancing',
  learning_goal: 'basic action verbs',
  steps: ['Step 1: List down German action verbs.', 'Step 2: Understand their meanings.', 'Step 3: Choreograph a dance using the verbs.', 'Step 4: Practice and refine.', 'Step 5: Perform and enjoy!'],
  vocab_words: ['tanzen', 'springen', 'laufen', 'drehen', 'schwingen']
)

german_dancing_question = Question.create!(
  question_content: 'What is the English translation for the German word tanzen?',
  project: german_dancing
)
Answer.create!(
  answer_content: 'Tanzen means dance in English.',
  points: 5,
  question: german_dancing_question
)


  # Accepted project 1
sql_cooking = Project.create!(
  name: 'Database Delicacies: Cooking up SQL Queries',
  subject: 'SQL',
  description: 'Dive into the world of relational databases while relating it to your passion for cooking. Create a database for recipes, ingredients, and cuisines using basic SQL queries.',
  deadline: DateTime.now + 1.week,
  status: :accepted,
  points: 10,
  user: kevin,
  interest: 'cooking',
  learning_goal: 'basic queries',
  steps: ['Step 1: Design a database schema.', 'Step 2: Create tables for recipes and ingredients.', 'Step 3: Insert data into the tables.', 'Step 4: Write basic SQL queries to fetch data.', 'Step 5: Analyze and optimize your queries.'],
  vocab_words: ['SELECT', 'FROM', 'WHERE', 'JOIN', 'GROUP BY']
)

sql_cooking_question = Question.create!(
  question_content: 'What does SQL stand for? ',
  project: sql_cooking
)
Answer.create!(
  answer_content: 'Structured Query Language',
  points: 5,
  question: sql_cooking_question
)

sql_cooking_question2 = Question.create!(
  question_content: 'What key word combines data from different tables?',
  project: sql_cooking
)
Answer.create!(
  answer_content: 'JOIN',
  points: 5,
  question: sql_cooking_question2
)

sql_cooking_question3 = Question.create!(
  question_content: 'What was your most popular ingredient in your cookbook?',
  project: sql_cooking
)
Answer.create!(
  answer_content: '',
  points: 5,
  question: sql_cooking_question3
)

sql_cooking_question4 = Question.create!(
  question_content: 'What key word can you use to put your results into categories?',
  project: sql_cooking
)
Answer.create!(
  answer_content: 'GROUP BY',
  points: 5,
  question: sql_cooking_question4
)

sql_cooking_question5 = Question.create!(
  question_content: 'What key word can you use to limit your results to ten recipes?',
  project: sql_cooking
)
Answer.create!(
  answer_content: 'LIMIT',
  points: 5,
  question: sql_cooking_question5
)


# Accepted project 2

architecture_drawing = Project.create!(
  name: 'Architectural Sketching: Bringing Buildings to Life',
  subject: 'Architecture',
  description: 'Understand the fundamental principles of architectural drawing. Develop skills in sketching various architectural elements. Apply artistic techniques to create expressive and detailed architectural drawings. Gain a deeper appreciation for the relationship between architecture and art.',
  deadline: DateTime.parse('2023-08-12 17:30:00'),
  status: :accepted,
  points: 10,
  user: kevin,
  interest: 'drawing',
  steps: ['Step 1: Gather your favorite art materials.', 'Step 2: Choose the type of structure to draw.', 'Step 3: Research examples of your structure.', 'Step 4: Create a rough sketch.', 'Step 5: Start drawing!'],
  vocab_words: ['bridge', 'structure', 'angles', 'scaffolding', 'building']
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

# Completed Project 1
language_drawing2 = Project.create!(
  name: 'Learn Spanish by Creating a Comic Book',
  subject: 'Spanish',
  description: 'Learn basic spanish verbs by creating a comic book! Choose a setting that appeals to you, choose your characters, and make a list of what their actions. Your goal is to use 5 - 10 action verbs in your comic strip.',
  deadline: DateTime.now,
  status: :completed,
  points: 10,
  user: kevin,
  interest: 'drawing',
  learning_goal: 'past tense action verbs',
  steps: ['Step 1: Choose your setting.', 'Step 2: Choose your characters.', 'Step 3: Think of 4 -5 main points for your story.', 'Step 4: Make a list of vocab words that you will use.', 'Step 5: Start drawing!'],
  vocab_words: ['bailar', 'comer', 'saltar', 'correr', 'cantar']
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

# Completed project 2
language_starwars = Project.create!(
  name: 'A New Hope: Exploring Spanish Vocabulary Through Star Wars',
  subject: 'Spanish',
  description: 'The objective of this lesson is to introduce students to Spanish vocabulary by using terms and concepts from the Star Wars universe. Students will engage with popular Star Wars characters, settings, and phrases while expanding their language skills.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :accepted,
  points: 10,
  user: kevin,
  interest: 'star wars',
  learning_goal: 'emotions and feelings',
  steps: ['Step 1: Choose your favorite Star Wars character.', 'Step 2: Choose a scene that involved that character that you felt attached to.', 'Step 3: Write down 3 - 5 feelings that describe that character in that moment.', 'Step 4: Find the Spanish translation for those words.', 'Step 5: Write a short story describing how those characters felt in Spanish!'],
  vocab_words: ['relajada', 'emocionado', 'aburrida', 'feliz', 'triste']
)
language_starwars_question = Question.create!(
  question_content: 'What is the Spanish translation for "space" and "planet," two vocabulary words related to Star Wars?',
  project: language_starwars
)
Answer.create!(
  answer_content: 'espacio and planeta',
  points: 5,
  question: language_starwars_question
)


# Completed project 3
german_feelings_dancing = Project.create!(
  name: 'Expressive Dance: Feel the German Emotions',
  subject: 'German',
  description: 'Explore the world of emotions in the German language. As you learn about feelings and moods in German, incorporate them into dance movements, capturing the essence of each emotion.',
  deadline: DateTime.now - 3.weeks,
  status: :completed,
  points: 10,
  user: kevin,
  interest: 'dancing',
  learning_goal: 'basic feelings',
  steps: ['Step 1: List German words for emotions.', 'Step 2: Understand each feeling.', 'Step 3: Dance like no one is watching.', 'Step 4: Write down how you felt.', 'Step 5: Share your feelings with someone from Germany!'],
  vocab_words: ['Glucklich', 'Traurig', 'Wutend', 'Begeistert', 'Verwirrt']
)
german_feelings_dancing_question = Question.create!(
  question_content: 'How do you say happy in German?',
  project: german_feelings_dancing
)
Answer.create!(
  answer_content: 'Glucklich',
  points: 5,
  question: german_feelings_dancing_question
)

# Completed Project 4
architecture_animation = Project.create!(
  name: 'Animate Your Architectural Imagination: Exploring Architecture through Japanese Animation',
  subject: 'Architecture',
  description: 'Analyze the influence of architecture in Japanese animation. Recognize architectural elements and styles commonly depicted in anime. Understand the cultural significance of architecture in different anime settings. Apply architectural concepts to create a unique anime-inspired building design.',
  deadline: DateTime.parse('2023-08-12 17:30:00'),
  status: :completed,
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


# *****************CURTIS PROJECTS*****************
coding = Project.create!(
  name: 'Learn Web Development With Ruby On Rails!',
  subject: 'Computer Science',
  description: 'In this engaging and hands-on lesson, students will be introduced to the world of web development using Ruby on Rails, a powerful and user-friendly web application framework. Through a step-by-step approach, students will gain a fundamental understanding of how to create dynamic and interactive web applications.',
  deadline: DateTime.now,
  status: :pending,
  points: 10,
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
  points: 10,
  user: curtis,
  interest: 'cooking'
)
culture_japanese_question = Question.create!(
  question_content: 'In the anime "Spirited Away," what is the significance of the bento box that Chihiro\'s parents eat?',
  project: culture_japanese
)
Answer.create!(
  answer_content: 'It represents their lack of awareness and respect for the spirit world.',
  points: 5,
  question: culture_japanese_question
)

geography_kirby = Project.create!(
  name: 'Exploring Geography Through Kirby\'s Adventures',
  subject: 'Geography',
  description: 'The objective of this lesson is to engage students in learning geography concepts through the world of Kirby, a beloved video game character. By exploring various in-game environments, students will gain insights into geographical features, ecosystems, and their real-world counterparts.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :completed,
  points: 10,
  user: curtis,
  interest: 'kirby'
)
geography_kirby_question = Question.create!(
  question_content: 'In "Kirby and the Forgotten Land," Kirby explores a post-apocalyptic city. How might this virtual city help us learn about real-world urban environments?',
  project: geography_kirby
)
Answer.create!(
  answer_content: 'It shows us how cities can change over time due to various factors',
  points: 5,
  question: geography_kirby_question
)

# *****************JURI PROJECTS*****************
history_japanese = Project.create!(
  name: 'Exploring Japanese History through Interactive Timeline',
  subject: 'History',
  description: 'The objective of this lesson activity is to engage students in exploring key events and periods in Japanese history through an interactive timeline. By the end of the activity, students will have a better understanding of the significant milestones in Japan\'s rich historical past.',
  deadline: DateTime.now,
  status: :completed,
  points: 10,
  user: juri,
  interest: 'history'
)
history_japanese_question = Question.create!(
  question_content: 'Which historical event on the Japanese history timeline led to the end of the samurai era and the beginning of the Meiji Restoration?',
  project: history_japanese
)
Answer.create!(
  answer_content: 'The overthrow of the Tokugawa Shogunate in 1868',
  points: 5,
  question: history_japanese_question
)

design_fashion = Project.create!(
  name: 'Exploring Design through Fashion: Unleash Your Creative Style',
  subject: 'Design',
  description: 'The objective of this lesson is to introduce students to the world of design through the lens of fashion. Students will learn about the principles of design, color theory, and personal expression while creating their own fashion designs.',
  deadline: DateTime.parse('2023-08-07 14:30:00'),
  status: :pending,
  points: 10,
  user: juri,
  interest: 'fashion'
)
design_fashion_question = Question.create!(
  question_content: 'What are the fundamental elements of design and how do they apply to fashion?',
  project: design_fashion
)
Answer.create!(
  answer_content: 'line, shape, form, texture, and color',
  points: 5,
  question: design_fashion_question
)

design_samurai = Project.create!(
  name: 'Designing Samurai Aesthetics: Exploring Art and Culture',
  subject: 'Design',
  description: 'The objective of this lesson is to introduce students to the design principles and artistic aesthetics of samurai culture. Through this lesson, students will learn about the visual elements, symbolism, and historical significance of samurai design.',
  deadline: DateTime.parse('2023-09-01 17:30:00'),
  status: :accepted,
  points: 10,
  user: juri,
  interest: 'samurai'
)
design_samurai_question = Question.create!(
  question_content: 'What are some key design elements in samurai culture, and how do they contribute to the aesthetics of samurai armor and weaponry?',
  project: design_samurai
)
Answer.create!(
  answer_content: 'intricate patterns, symbolic motifs, and careful material selection',
  points: 5,
  question: design_samurai_question
)

# *****************FAVI PROJECTS*****************
math_music = Project.create!(
  name: 'Math in Music: Understanding Rhythms and Beats',
  subject: 'Mathematics',
  description: 'This lesson aims to introduce students to the mathematical concepts underlying musical rhythms and beats. By exploring the relationship between math and music, students can develop a deeper appreciation for both subjects.',
  deadline: DateTime.now,
  status: :accepted,
  points: 10,
  user: favi,
  interest: 'music'
)
math_music_question = Question.create!(
  question_content: 'How do musicians use fractions in musical notation to represent different note durations?',
  project: math_music
)
Answer.create!(
  answer_content: 'Each musical note is assigned a specific fraction of a whole note.',
  points: 5,
  question: math_music_question
)

history_spiderman = Project.create!(
  name: 'Unraveling History Through Spider-Man: Exploring Social and Cultural Contexts',
  subject: 'History',
  description: 'The objective of this lesson is to use Spider-Man as a lens to explore various historical periods and social contexts. Students will analyze how Spider-Man\'s character and stories reflect and respond to the cultural and historical issues of different eras.',
  deadline: DateTime.parse('2023-08-07 14:30:00'),
  status: :pending,
  points: 10,
  user: favi,
  interest: 'spider-man'
)
history_spiderman_question = Question.create!(
  question_content: 'How does Spider-Man\'s character and stories reflect the historical and social contexts of different eras?',
  project: history_spiderman
)
Answer.create!(
  answer_content: 'Spider-Man\'s struggles with responsibility and identity resonate with universal human experiences while also mirroring the challenges and values of the times in which they were written',
  points: 5,
  question: history_spiderman_question
)

math_sharkweek = Project.create!(
  name: 'Dive into Math with Sharks: Exploring Mathematical Concepts Through Shark Study',
  subject: 'Mathematics',
  description: 'The objective of this lesson is to engage students in mathematical concepts by using sharks as a real-world context. Students will apply various math skills to analyze data, make calculations, and solve problems related to shark characteristics and behaviors.',
  deadline: DateTime.parse('2023-08-07 14:30:00'),
  status: :completed,
  points: 10,
  user: favi,
  interest: 'shark week'
)
math_sharkweek_question = Question.create!(
  question_content: 'How does math help scientists learn about sharks and their behaviors?',
  project: math_sharkweek
)
Answer.create!(
  answer_content: 'figure out averages, make predictions, and understand patterns',
  points: 5,
  question: math_sharkweek_question
)

puts 'Creating buddy chatroom...'

Chatroom.create!(
  name: 'Buddy Chat'
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
