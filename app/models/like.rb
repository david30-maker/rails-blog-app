class Like < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post


    # belongs_to :author, class_name: 'User'
    # belongs_to :post
    # validates :author_id, uniqueness: { scope: :post_id }
end
