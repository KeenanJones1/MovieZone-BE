class MoviesController < ApplicationController
 def create 
  movie = Movie.find_by(query: params['query'])
  user = User.find_by(uuid: params['uuid'])
  if movie && user
   movie.user_movie_check(user, params['thumbs'])
   render json: {movie: movie, message: "success"}
  elsif !movie && user
   movie = Movie.new
   movie.create_and_like(params['title'], params['query'], params['thumbs'], user)
   render json: {movie: movie, message: "success"}
  else
   render json: {message: 'User not found', code: 404, status: 'error'}
  end

 end

 def index
  results = []
  user = User.find_by(uuid: params['uuid'])
  if params['queries']
  for ele in params['queries']
   if Movie.find_by(query: ele)
    movie = Movie.find_by(query: ele)
    results.push(movie)
   end
  end
  render json: {movies: results, message: "sucess"}
 else
  movies = Movie.all
  render json: movies
  end
 end


 private
 def movie_params
  params.require(:movie).permit(:title, :query, :queries, :thumbs)
 end
end
