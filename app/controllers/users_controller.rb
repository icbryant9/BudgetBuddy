class UsersController < ApplicationController
    
  def index
    @users = User.all
  end




  def show 
    @user = User.find(params[:id])
    @goals = Goal.all
    @posts = Post.where(user_id:@user.id).order(created_at: :desc)

  end 




end
