class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
  
  validates :title, length: {minimum: 3, maximum: 14}, presence: true
  validates :content, presence: true
end
