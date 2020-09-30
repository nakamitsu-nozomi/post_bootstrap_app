class RestAllPostCacheCounters < ActiveRecord::Migration[6.0]
  def up
    Post.find_each{|post| Post.reset_counters(post.id,:likes_count)}
  end

  def down
  end

end
