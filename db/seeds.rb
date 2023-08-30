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

# interests = %w[animation dancing singing writing cooking traveling crafts animals anime manga star\ wars harry\ potter shark\ week samurai martial\ arts programming history music fashion science astronomy yoga video\ games final\ fantasy spider-man kirby]

interests = ['Singing 🎤', 'Writing ✍️', 'Cooking 🧑‍🍳', 'Traveling ✈️', 'Nature 🌿', 'Animals 🐶', 'Drinking 🍷', 'Manga 📚', 'Star wars ⭐️', 'Harry potter 🧙🏻', 'Architecture 🏛️', 'Ninja 🥷', 'Disney 🧜🏻‍♀️', 'Programming 👩‍💻', 'History 🏯', 'Music 🎵', 'Fashion 👘', 'Science 🧪', 'Astronomy 🪐', 'Yoga 🧘‍♀️', 'Video games 🎮', 'Makeup 💄', 'Spider-man 🕸️', 'Movie 🍿']

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
  name: 'painting 🎨'
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

juri_interest = Interest.create!(
  name: 'dancing 💃🏻'
)

UserInterest.create!(
  user: juri,
  interest: juri_interest
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

favi_interest = Interest.create!(
  name: 'Photography 📸'
)

UserInterest.create!(
  user: favi,
  interest: favi_interest
)

puts 'Users created!'

puts 'Creating projects...'

# *****************KEVIN PROJECTS*****************

# Recommended project 1

star_wars_js = Project.create!(
  name: 'Galactic Code: Programming with Star Wars in JavaScript',
  subject: 'JavaScript',
  description: 'Harness the force of JavaScript to explore programming basics with Star Wars. Create functions and variables that represent characters, starships, and planets from a galaxy far, far away.',
  deadline: DateTime.now + 2.weeks,
  status: :pending,
  points: 10,
  user: kevin,
  interest: 'star wars',
  learning_goal: 'programming basics in JavaScript',
  steps: ['Step 1: Setup your JavaScript environment.', 'Step 2: Create variables for your favorite characters.', 'Step 3: Write a function that displays the attributes of a Star Wars character.', 'Step 4: Create an array of Star Wars planets and loop through them.', 'Step 5: Integrate conditional statements to decide the fate of the galaxy based on character attributes.'],
  vocab_words: ['variable', 'function', 'array', 'loop', 'conditional']
)

sw_js_question1 = Question.create!(
  question_content: 'In JavaScript, what keyword is used to declare a variable?',
  project: star_wars_js
)
Answer.create!(
  answer_content: 'var, let (for block-scoped variables), or const (for constants)',
  points: 5,
  question: sw_js_question1
)

sw_js_question2 = Question.create!(
  question_content: 'How do you define a function in JavaScript?',
  project: star_wars_js
)
Answer.create!(
  answer_content: 'You can use the function keyword, followed by the function name and parentheses.',
  points: 5,
  question: sw_js_question2
)

sw_js_question3 = Question.create!(
  question_content: 'What Star Wars character is known to say "Do or do not, there is no try"?',
  project: star_wars_js
)
Answer.create!(
  answer_content: 'Yoda',
  points: 5,
  question: sw_js_question3
)

sw_js_question4 = Question.create!(
  question_content: 'How do you loop through an array in JavaScript?',
  project: star_wars_js
)
Answer.create!(
  answer_content: 'You can use a for loop, for...of loop, forEach method, or other looping mechanisms.',
  points: 5,
  question: sw_js_question4
)

sw_js_question5 = Question.create!(
  question_content: 'What is a boolean data type in JavaScript?',
  project: star_wars_js
)
Answer.create!(
  answer_content: 'A boolean data type can have one of two values: true or false.',
  points: 5,
  question: sw_js_question5
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
samurai_pm = Project.create!(
  name: 'Bushido & Boards: Communicating in the Way of the Samurai',
  subject: 'Project Management',
  description: 'Channel the code of the samurai, Bushido, into your project management endeavors. Understand the importance of clear communication by viewing it through the lens of samurai traditions. Learn how clarity, honor, and respect, cornerstones of the samurai way, can improve team coordination and lead to project success.',
  deadline: DateTime.now + 3.weeks,
  status: :pending,
  points: 10,
  user: kevin,
  interest: 'samurai',
  learning_goal: 'communication in project management',
  steps: ['Step 1: Study the principles of Bushido and their relevance to clear communication.', 'Step 2: Create a communication plan inspired by samurai hierarchy.', 'Step 3: Emulate the clarity and precision of a samurai duel in team meetings.', 'Step 4: Incorporate samurai honor and respect into stakeholder communications.', 'Step 5: Reflect on the impact of the samurai approach and make necessary adjustments to your communication strategies.'],
  vocab_words: ['Bushido', 'Honor', 'Respect', 'Clarity', 'Stakeholder']
)

samurai_pm_question1 = Question.create!(
  question_content: 'What is the code of conduct followed by samurai called?',
  project: samurai_pm
)
Answer.create!(
  answer_content: 'Bushido',
  points: 5,
  question: samurai_pm_question1
)

samurai_pm_question2 = Question.create!(
  question_content: 'Why is clear communication vital in project management?',
  project: samurai_pm
)
Answer.create!(
  answer_content: 'Clear communication ensures everyone understands their roles, responsibilities, and tasks. It prevents misunderstandings, keeps the project on track, and aligns the team towards common goals.',
  points: 5,
  question: samurai_pm_question2
)

samurai_pm_question3 = Question.create!(
  question_content: 'How does honor, as exemplified by the samurai, relate to stakeholder communication?',
  project: samurai_pm
)
Answer.create!(
  answer_content: 'Honor in stakeholder communication means being truthful, transparent, and accountable. Like the samurai who upheld their honor in every action, a project manager should maintain integrity and honesty in every communication.',
  points: 5,
  question: samurai_pm_question3
)

samurai_pm_question4 = Question.create!(
  question_content: 'What samurai principle emphasizes the importance of self-discipline and commitment?',
  project: samurai_pm
)
Answer.create!(
  answer_content: 'Bushido, specifically the value of "Rectitude" or "Justice"',
  points: 5,
  question: samurai_pm_question4
)

samurai_pm_question5 = Question.create!(
  question_content: 'How can the precision of a samurai duel be translated into team meetings?',
  project: samurai_pm
)
Answer.create!(
  answer_content: 'Much like the precision and focus required in a samurai duel, team meetings should be concise, well-structured, and purposeful. Every participant should be well-prepared, and discussions should be direct and to the point.',
  points: 5,
  question: samurai_pm_question5
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
  question_content: 'What key word combines data from different tables?',
  project: sql_cooking
)
Answer.create!(
  answer_content: 'JOIN',
  points: 5,
  question: sql_cooking_question
)

sql_cooking_question2 = Question.create!(
  question_content: 'What does SQL stand for? ',
  project: sql_cooking
)
Answer.create!(
  answer_content: 'Structured Query Language',
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

# Accepted Project 2
frontend_design_animals = Project.create!(
  name: 'Animal-Themed Web Design: Using HTML and CSS',
  subject: 'Front-End Design',
  description: 'Dive into the fascinating world of animals while designing a responsive webpage using HTML and CSS. Utilize various styling techniques to create visually appealing layouts featuring your favorite animals.',
  deadline: DateTime.now + 2.weeks,
  status: :accepted,
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

# Accepted Project 3
kirby_pm = Project.create!(
  name: 'Dream Land Synergy: Enhancing Teamwork with Kirby',
  subject: 'Project Management',
  description: 'Take a whimsical journey into Dream Land with Kirby to explore the essence of teamwork! Using Kirby adaptabilities and his penchant for combining powers, discover how to synergize the unique skills of your team to achieve project success.',
  deadline: DateTime.now + 3.weeks,
  status: :accepted,
  points: 10,
  user: kevin,
  interest: 'Kirby',
  learning_goal: 'improving teamwork in project management',
  steps: ['Step 1: Dive into Kirbys world and identify moments where teamwork was essential.', 'Step 2: Reflect on Kirbys ability to adapt and combine abilities. How can this be mirrored in team collaborations?', 'Step 3: Organize a "Copy Ability" workshop where team members share their unique skills and learn from one another.', 'Step 4: Create a "Dream Land Charter" that establishes team norms, values, and a shared vision.', 'Step 5: Hold a "Star Allies" retrospective to discuss team wins, areas of improvement, and strategies to enhance collaboration.'],
  vocab_words: ['Synergy', 'Adaptability', 'Copy Ability', 'Team Charter', 'Retrospective']
)

kirby_pm_question1 = Question.create!(
  question_content: 'In what ways does Kirby demonstrate adaptability in his adventures?',
  project: kirby_pm
)
Answer.create!(
  answer_content: 'Kirby demonstrates adaptability by inhaling enemies and copying their abilities, allowing him to tackle different challenges effectively.',
  points: 5,
  question: kirby_pm_question1
)

kirby_pm_question2 = Question.create!(
  question_content: 'How can "Copy Ability" be used as a metaphor for sharing and learning skills within a team?',
  project: kirby_pm
)
Answer.create!(
  answer_content: 'Just as Kirby gains abilities by copying others, team members can "copy" or learn from each other’s unique skills and strengths, enhancing the team’s overall capabilities.',
  points: 5,
  question: kirby_pm_question2
)

kirby_pm_question3 = Question.create!(
  question_content: 'Why is having a shared "Dream Land Charter" important for a team?',
  project: kirby_pm
)
Answer.create!(
  answer_content: 'A "Dream Land Charter" establishes a common understanding of team norms, values, and vision. It provides a foundation for how the team will work together, fostering a unified direction and enhancing collaboration.',
  points: 5,
  question: kirby_pm_question3
)

kirby_pm_question4 = Question.create!(
  question_content: 'What is the value of holding regular "Star Allies" retrospectives?',
  project: kirby_pm
)
Answer.create!(
  answer_content: 'Regular "Star Allies" retrospectives allow the team to reflect on their performance, celebrate successes, identify areas for improvement, and strategize on how to work better together. It’s a continuous feedback loop that promotes growth and collaboration.',
  points: 5,
  question: kirby_pm_question4
)

kirby_pm_question5 = Question.create!(
  question_content: 'How does synergy relate to Kirby and his team in Dream Land?',
  project: kirby_pm
)
Answer.create!(
  answer_content: 'Synergy is the combined effort of a group, producing results greater than the sum of their individual efforts. In Dream Land, Kirby and his allies often combine powers and work together, showcasing that teamwork and synergy can overcome even the toughest challenges.',
  points: 5,
  question: kirby_pm_question5
)



# Completed Project 1
cooking_ruby = Project.create!(
  name: 'Learn Ruby by Crafting a Digital Cookbook',
  subject: 'Ruby',
  description: 'Explore the richness of Ruby programming by building a digital cookbook! You will select a variety of recipes, organize ingredients, and map out the cooking steps using arrays and loops.',
  deadline: DateTime.now,
  status: :completed,
  points: 10,
  user: kevin,
  interest: 'cooking',
  learning_goal: 'arrays and loops',
  steps: ['Step 1: Choose your favorite recipes.', 'Step 2: List out ingredients for each recipe using an array.', 'Step 3: Plan the sequence of cooking steps using loops.', 'Step 4: Define additional features for your digital cookbook.', 'Step 5: Implement your digital cookbook using Ruby code.'],
  vocab_words: ['array', 'loop', 'iteration', 'index', 'ingredient']
)
cooking_ruby_question = Question.create!(
  question_content: 'In Ruby, how can you use a loop to iterate over an array of ingredients?',
  project: cooking_ruby
)
Answer.create!(
  answer_content: '.each method',
  points: 5,
  question: cooking_ruby_question
)


# Completed project 2
anime_directory_ruby = Project.create!(
  name: 'Anime Directory: Using Hashes and Symbols in Ruby',
  subject: 'Ruby',
  description: 'Develop an anime directory where you will store data about various anime series. Utilize hash and symbol capabilities to efficiently manage and retrieve information about your favorite shows, characters, and genres.',
  deadline: DateTime.now + 3.weeks,
  status: :completed,
  points: 10,
  user: kevin,
  interest: 'anime',
  learning_goal: 'hashes and symbols in Ruby',
  steps: ['Step 1: Define the structure of your anime directory using hashes and symbols. Consider properties like :title, :genre, :characters, etc.', 'Step 2: Populate your directory with a few sample anime entries.', 'Step 3: Implement functions to add, update, and delete anime entries.', 'Step 4: Create a function to retrieve information about a specific anime using its title (or another unique identifier).', 'Step 5: Enhance the directory by adding features like searching by genre or listing all characters in the directory.'],
  vocab_words: ['hash', 'symbol', ':title', ':genre', 'key-value pair']
)
anime_directory_ruby_question = Question.create!(
  question_content: 'How do symbols in Ruby differ from strings, and why might they be used as hash keys?',
  project: anime_directory_ruby
)
Answer.create!(
  answer_content: 'Symbols are immutable and unique, ensuring that there is only one object for a given symbol, which makes them memory-efficient compared to strings. This uniqueness and immutability make symbols ideal for hash keys as they provide consistent behavior and performance advantages.',
  points: 5,
  question: anime_directory_ruby_question
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
