class UserSerializer 
 def initialize(user_object)
  @user = user_object
 end

 def to_serialized_json
  # method to get all movies interacted with from user
  byebug
  # @user.to_json(:only => [:username, :email], :include => {:reading_lists => {:only => [:id, :name, :type], :include => {:reading_list_books => {:include => {:book => {:only => [:title, :author, :published_year, :genre, :description, :pages]}}}}}, :stats => {:only => [:id, :name, :value, :goal, :level]}})
 end

 def user_movies_serialized_json
   # method to get the last three movies interacted with by user
  @user.to_json(only: [:uuid],
    include: {likes: { include: {movie: {only: [:title, :up_count, :down_count, :query]}}}, dislikes: {include: {movie: {only:[:title, :up_count, :down_count, :query]}}
    }}
  )
 end


end