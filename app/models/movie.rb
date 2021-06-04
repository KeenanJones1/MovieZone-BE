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
  if self.up_count >= 0
    self.update( up_count: self.up_count - 1)
  else 
    self.update(up_count: 0)
  end
  self.update(down_count: self.down_count + 1)
 end

 def dislike_to_like(user)
  dislike = Dislike.find_by(user: user, movie: self)
  dislike.destroy 
  like = Like.create(user: user, movie: self)
  if self.down_count >= 0 
    self.update(down_count: self.down_count - 1)
  else
    self.update(down_count: 0)
  end
  self.update(up_count: self.up_count + 1)
 end

 def user_movie_check(user, thumb)
  if Like.find_by(user_id: user.id, movie_id: self.id) && thumb === 'down'
   self.like_to_dislike(user)
  elsif Dislike.find_by(user_id: user.id, movie_id: self.id) && thumb === 'up'
   self.dislike_to_like(user)
  else
   self.movie_check(thumb, user)
  end
 end

 def movie_check(thumb, user)
  if thumb == 'up'
   Like.create(movie_id: self.id, user: user)
    self.up_count += 1
  else 
   Dislike.create(movie_id: self.id, user: user)
   self.down_count += 1
  end
 end

 def create_and_like(title, query, thumb, user)
  self.title = title
  self.query = query
  if thumb === 'down'
    self.up_count = 0
    self.down_count = 1
    self.save
    Dislike.create(movie_id: self.id, user: user)
  else
     self.up_count = 1
     self.down_count = 0
     self.save
     Like.create(movie_id: self.id, user: user)
  end
 end





end
