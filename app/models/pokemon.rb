class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :type
  has_many :comments
  has_many :trainers, through: :comments
end
