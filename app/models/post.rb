class Post < ApplicationRecord

    belongs_to :user
    # belongs_to :user,optional: true
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
