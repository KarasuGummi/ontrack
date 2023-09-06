# 🛣️ OnTrack

A flexible educational application that assists with learning and is paired with a Tamagotchi-like companion. OnTrack can create users fun and interactive projects that are curated to their learning goals, interests, and hobbies. In addition, users are paired with their very own 'buddy' that will grow alongside them. Completed projects earn points, which can be used to feed and customize the 'buddy', making the user's educational journey personal to them.

![Screenshot_2023-09-06-10-25-13-11_40deb401b9ffe8e1df2f1cc5ba480b12](https://github.com/KarasuGummi/ontrack/assets/1535336/a5900500-b090-467f-9e6e-3f764c368922)
![Screenshot_2023-09-06-10-28-31-49_40deb401b9ffe8e1df2f1cc5ba480b12](https://github.com/KarasuGummi/ontrack/assets/1535336/2c6ecf05-313c-4623-a5c6-26567e156921)
![Screenshot_2023-09-06-10-28-05-50_40deb401b9ffe8e1df2f1cc5ba480b12](https://github.com/KarasuGummi/ontrack/assets/1535336/3eabf01a-801a-4128-9a69-dc1d5c9dbb74)
![Screenshot_2023-09-06-10-27-44-71_40deb401b9ffe8e1df2f1cc5ba480b12](https://github.com/KarasuGummi/ontrack/assets/1535336/964332ea-b827-4c14-a9a7-4c5c7008818c)

<br>
## 📕 Usage
App home: https://www.ontrack.tokyo/

User </br>
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
