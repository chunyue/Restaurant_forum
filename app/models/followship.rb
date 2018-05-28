class Followship < ApplicationRecord
  #屬於user 也屬於追蹤的人(following)
  belong_to :user
  belong_to :following, class_name: "User"
end
