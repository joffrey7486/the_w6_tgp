class JoinUserDm < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :dm
end
