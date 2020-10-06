class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end 
  
  def search
    user_search = UserSearch.new(params_user_search)
    @users = user_search.execute
  end

  def following
    @user= User.find(params[:id])
    @users=@user.followings
    render "show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render "show_follower"
  end
  

  private
  def params_user_search
    params.permit(:search_nickname)
  end
end
