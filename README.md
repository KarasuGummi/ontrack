# 🛣️ OnTrack

A flexible educational application that assists with learning and is paired with a Tamagotchi-like companion. OnTrack creates fun and interactive projects that are curated to the learning goals, interests, and hobbies of each user. In addition, users are paired with their very own 'buddy' that will grow alongside them. Completed projects earn points, which can be used to feed and customize the 'buddy', making the user's educational journey personal to them.

## Future Developments

This repository showcases the original project as developed collaboratively by our team. I'm excited about the potential of this project and I am actively continuing its development in a separate private repository. If you're interested in collaboration, partnerships, or have any inquiries about the current state of the project, feel encouraged to contact me. - [Kevin Collier](mailto:collier.kevin.m@gmail.com)


<img width="200" height="416" alt="dashboard" src="https://github.com/KarasuGummi/ontrack/assets/1535336/cc01ec37-63ef-46cd-9eca-303aaac74dbe">
<img width="200" alt="profile" src="https://github.com/KarasuGummi/ontrack/assets/1535336/2c6ecf05-313c-4623-a5c6-26567e156921">
<img width="200" alt="dashboard" src="https://github.com/KarasuGummi/ontrack/assets/1535336/3eabf01a-801a-4128-9a69-dc1d5c9dbb74">
<img width="200" alt="dashboard" src="https://github.com/KarasuGummi/ontrack/assets/1535336/964332ea-b827-4c14-a9a7-4c5c7008818c">


## 📕 Usage
App home: https://www.ontrack.tokyo/

User: kevin@ontrack.com</br>
PW: buddy000

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
OPENAI_ACCESS_TOKEN=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements


## Team Members
- [Curtis Lu](https://www.linkedin.com/in/curtis-lu/)
- [Kevin Collier](https://www.linkedin.com/in/kevin-collier/)
- [Juri Kato](https://www.linkedin.com/in/juri-kato-3382a5186/)
- [Favio Valero Fernandez](https://www.linkedin.com/in/vffavio/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
