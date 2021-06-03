class Movie < ApplicationRecord
 has_many :likes
 has_many :dislikes

 # before create make sure the same movie is only added once
 # validate title and other content
 # validations 

 # creating a movie thumbs fields are default are zero

 # updating a the like and dislike count

 # keeping track of the users that are making likes and dislike. 


end
