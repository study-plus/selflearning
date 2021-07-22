class Post < ApplicationRecord

    belongs_to :user
    # belongs_to :user,optional: true
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :checks, dependent: :destroy
    has_many :checked_users, through: :checks, source: :user
end
