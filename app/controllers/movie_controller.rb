class MovieController < ApplicationController
 def create 
  byebug
 end

 def show 
  byebug
 end

 def update
  byebug
 end

 private
 def movie_params
  params.require(:movie).permit(:title, :query)
 end
end
