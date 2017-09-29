# Commune
## Commune is an online community application similar to Reddit.

## Features
- Users can sign up for an account
- Users can up-vote or down-vote on posts of other users, and posts are ranked based on votes
- Users can create posts and edit and delete posts which belong to them
- Users can comment on other users' posts
- Users can favorite posts to receive email notifications about new comments on that post
- Moderators can edit and delete posts of all users
- Admins can create topics along with edit and delete posts of all users

## Setup and Configuration
**Ruby v. 2.3.3**
**Rails v. 4.2.5**

**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Gems Used:**

- *Factory Girl* - Development
- *Bootstrap* - Styling
- *Bcrypt* - Data Encryption
- *Figaro* - Environmental Variables
- *Rspec* - TDD

**Set-up:**

Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by GitHub).
The config/application.example.yml illustrates the formatting for environmental variables.

**To run Commune locally:**

1. Clone the repository
2. Run `bundle install`
3. Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
4. Start the server using `rails s`
5. Run the app on localhost:3000
