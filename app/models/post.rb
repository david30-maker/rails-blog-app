class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :increment_user_posts_counter
  after_destroy :decrement_user_posts_counter

  after_create :update_likes_counter
  after_destroy :update_likes_counter

  private

  def increment_user_posts_counter
    user.increment!(:posts_count)
  end

  def decrement_user_posts_counter
    user.decrement!(:posts_count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    self.comments_count = comments.count
    save
  end

  def update_likes_counter
    self.likes_count = likes.count
    save
  end
end
