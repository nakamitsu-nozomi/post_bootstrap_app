class UserSearch
  include ActiveModel::Model
  attr_accessor :search_nickname,:search_id

  def execute
    User.ransack(nickname_eq: @search_nickname,id_eq: @search_id).result
  end
end