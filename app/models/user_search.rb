class UserSearch
  include ActiveModel::Model
  attr_accessor :search_nickname

  def execute
    User.ransack(nickname_cont: @search_nickname).result
  end
end