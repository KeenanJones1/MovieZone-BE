# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Like.destroy_all
Dislike.destroy_all
Movie.destroy_all
User.destroy_all
 
  movies = Movie.create(title: 'Up', up_count: 54, down_count: 11, query: 'tt1049413')

  user = User.create(uuid: '123')

  like = Like.create(user: user, movie: movies)


