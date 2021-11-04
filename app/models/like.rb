class Like < ApplicationRecord
  belongs_to :gossip
  belongs_to :comment
  belongs_to :user
end
