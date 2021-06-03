class Movie < ApplicationRecord
 has_many :likes
 has_many :dislikes
 # before create make sure the same movie is only added once
 # validate title and other content
 # validations 

 # creating a movie thumbs fields are default are zero

 # updating a the like and dislike count

 # keeping track of the users that are making likes and dislike. 

 def like_to_dislike(user) 
  like = Like.find_by(user: user, movie: self)
  like.destroy 
  dislike = Dislike.create(user: user, movie: self)
  self.up_count -= 1
  self.down_count += 1
 end

 def dislike_to_like(user)
  dislike = Dislike.find_by(user: user, movie: self)
  like.destroy 
  like = Like.create(user: user, movie: self)
  self.up_count -= 1
  self.down_count += 1
 end

 def user_movie_check(user, thumb)
  if Like.find_by(user: user, movie: self) && thumb === 'down'
   self.like_to_dislike(user)
  elsif Dislike.find_by(user: user, movie: self) && thumb === 'up'
   self.dislike_to_like(user)
  else
   self.movie_check(thumb, user)
  end
 end



 def movie_check(thumb, user)
  if thumb == 'up'
   Like.create(movie: self, user: user)
    self.up_count += 1
  else 
   Dislike.create(movie: movie, user: user)
   movie.down_count += 1
  end
 end



end
