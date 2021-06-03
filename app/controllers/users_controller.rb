class UsersController < ApplicationController
 def create
  user = User.create(user_params)
  if user 
   render json: {message: 'complete'}
  else
   render json: {status: "error", code: 3000, message: "Can't find User info"}
  end
 end

 def show
  user = User.find_by(uuid: params['id'])
  render json: UserSerializer.new(user).user_movies_serialized_json
 end


 def update
  byebug
 end

 private
 def user_params
  params.require(:user).permit(:uuid)
 end

end
