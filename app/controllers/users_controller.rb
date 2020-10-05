class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end 
  
  def search
    user_search = UserSearch.new(params_user_search)
    @users = user_search.execute
  end

  private
  def params_user_search
    params.permit(:search_nickname)
  end
end
