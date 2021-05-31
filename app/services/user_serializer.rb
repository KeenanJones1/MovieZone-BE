class UserSerializer 
 def initialize(user_object)
  byebug
  @user = user_object
 end

 def to_serialized_json
  # method to get all movies interacted with from user
  byebug
  # @user.to_json(:only => [:username, :email], :include => {:reading_lists => {:only => [:id, :name, :type], :include => {:reading_list_books => {:include => {:book => {:only => [:title, :author, :published_year, :genre, :description, :pages]}}}}}, :stats => {:only => [:id, :name, :value, :goal, :level]}})
 end

 def recent_movies_serialized_json
   # method to get the last three movies interacted with by user.
  byebug
  # user_lists = @user.reading_lists
  # user_lists.to_json(:only => [:id, :name, :type], :include => {:reading_list_books => {:include => {:book => {:only => [:title, :author, :published_year, :genre, :description, :pages]}}}})
 end


end