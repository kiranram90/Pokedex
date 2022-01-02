class Pokemon < ApplicationRecord
  belongs_to :user 
  #belongs to different type. Requirement!!
  has_many :comments
  has_many :users, through: :comments
  validates :title, :presence => true
  validates :title, :uniqueness => true
end
