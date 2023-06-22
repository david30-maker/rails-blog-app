class User < ApplicationRecord
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  after_create :update_posts_counter
  after_destroy :update_posts_counter

  def update_posts_counter
    self.posts_counter = posts.count
    save
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
