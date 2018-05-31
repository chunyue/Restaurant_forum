class Followship < ApplicationRecord
  validates :following_id, uniqueness: { scope: :user_id }

  #屬於user 也屬於追蹤的人(following)
  belongs_to :user
  belongs_to :following, class_name: "User", optional: true
end
