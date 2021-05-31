class UsersController < ApplicationController
 def create
  byebug
  render json: UserSerializer.new(user).to_serialized_json
 end

 def show
  user = User.find_by(uuid: params['id'])
  byebug 
  render json: UserSerializer.new(user).recent_movies_serialized_json
 end


 def update
  byebug
 end

 private
 def user_params
  params.require(:user).permit(:uuid)
 end

end
