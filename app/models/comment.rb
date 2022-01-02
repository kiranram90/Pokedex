class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :content, presence: true
end
