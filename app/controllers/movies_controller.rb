class MoviesController < ApplicationController
 def create 
  movie = Movie.find_by(query: params['query'])
  user = User.find_by(uuid: params['uuid'])

  if movie && user
   movie.user_movie_check(user, params['thumbs'])
   render json: {movie: movie}
  elsif !movie && user
     movie = Movie.create(query: params['query'], title: params['title'], up_count: 0, down_count: 0)
     movie.movie_check(params['thumbs'], user)
     render json: {movie: movie}
  else
   render json: {message: 'User not found', code: 404, status: 'error'}
  end
 end

 def index
  results = []
  user = User.find_by(uuid: params['uuid'])
  for ele in params['queries']
   if Movie.find_by(query: ele)
    movie = Movie.find_by(query: ele)
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
  params.require(:movie).permit(:title, :query, :queries, :thumbs)
 end
end
