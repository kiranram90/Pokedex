class Trainer < ApplicationRecord
has_many :posts
has_many :comments
has_many :commented_posts, through: :comments, source: :post
has_many :pokemons
has_secure_password #gives uthenticate, validate password & confirm - for password digest &  
end
