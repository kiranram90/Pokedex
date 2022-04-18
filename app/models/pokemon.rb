class Pokemon < ApplicationRecord
  belongs_to :user 
  #belongs to different type. Requirement!!
  has_one_attached :image
  has_many :comments
  has_many :users, through: :comments
  validates :title, :presence => true
  validates :title, :uniqueness => {:case_sensitive => false}

  scope :with_comments, -> { joins(:comments).group('pokemons.id').having('count(pokemon_id) > 0') }
end
