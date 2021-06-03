class MoviesController < ApplicationController
 def create 
  movie = Movie.find_by(query: params['query'])
  user = User.find_by(uuid: params['uuid'])
  if !movie && user
   movie = Movie.create(query: params['query'], title: params['title'], up_count: 0, down_count: 0)
   if params['thumbs'] == 'up'
    Like.create(movie: movie, user: user)
    movie.up_count += 1
    render json: {movie: movie}
   else
    Dislike.create(movie: movie, user: user)
    movie.down_count += 1
    render json: {movie: movie}
   end

  else
   # user cannot like already liked movie 
   # user cannnot dislike already dislike movie
   if user
    Like.create(movie: movie, user: user)
    movie.up_count += 1
    render json: {message: 'Movie was like successfully'}
   elsif user && params['thumbs'] == 'down'
    Dislike.create(movie: movie, user: user)
    movie.down_count += 1
    render json: {message: 'Movie was disliked successfully'}
   else
    render json: {message: 'User not found', code: 404, status: 'error'}
   end
  end
 end

 def index
  results = []
  user = User.find_by(uuid: params['uuid'])
  for ele in params['queries']
   if Movie.find_by(query: ele)
    movie = Movie.find_by(query: ele)
    # if movie.likes.find_by(user_id: user.id)
    # movie['seen'] = {'true': 'liked'}
    # elsif movie.dislike.find_by(user_id: user.id)
    #  movie['seen'] = {'true': 'dislike'}
    # else
    #  movie['seen'] = 'false'
    # end
    results.push(movie)
   end
  end
  render json: {movies: results, message: "sucess"}
 end

 def show 
  byebug
 end

 def update
  byebug
 end

 private
 def movie_params
  params.require(:movie).permit(:title, :query, :queries)
 end
end
