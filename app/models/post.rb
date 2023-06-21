class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    # belongs_to :author, class_name: 'User'
    # has_many :comments, dependent: :destroy
    # validates :title, presence: true, length: { minimum: 5 }
    # validates :content, presence: true
end
