# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(username: 'leroyjenkins')
  user2 = User.create(username: 'renojackson')
  user3 = User.create(username: 'bobthebuilder')
  user4 = User.create(username: 'wreckitralph')

  Poll.destroy_all
  poll1 = Poll.create(author_id: user1.id, title: 'Flat Earth')
  poll2 = Poll.create(author_id: user2.id, title: 'Favorite Game')

  Question.destroy_all
  question1 = Question.create(poll_id: poll1.id, text: 'Is the Earth round?')
  question2 = Question.create(poll_id: poll2.id, text: 'Favorite board game?')
  question3 = Question.create(poll_id: poll2.id, text: 'Favorite video game?')

  AnswerChoice.destroy_all
  ac1 = AnswerChoice.create(question_id: question1.id, text: 'yes')
  ac2 = AnswerChoice.create(question_id: question1.id, text: 'no')
  ac3 = AnswerChoice.create(question_id: question2.id, text: 'Settlers of Catan')
  ac4 = AnswerChoice.create(question_id: question2.id, text: 'Monopoly')
  ac5 = AnswerChoice.create(question_id: question2.id, text: 'Chess')
  ac6 = AnswerChoice.create(question_id: question3.id, text: 'Chrono Trigger')
  ac7 = AnswerChoice.create(question_id: question3.id, text: 'Legend of Zelda')
  ac8 = AnswerChoice.create(question_id: question3.id, text: 'Hearthstone')

  Response.destroy_all
  resp1 = Response.create(user_id: user3.id, choice_id: ac1.id)
  resp2 = Response.create(user_id: user3.id, choice_id: ac4.id)
  resp3 = Response.create(user_id: user3.id, choice_id: ac7.id)
  resp4 = Response.create(user_id: user4.id, choice_id: ac5.id)
  resp5 = Response.create(user_id: user4.id, choice_id: ac6.id)


end
