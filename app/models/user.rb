class User < ApplicationRecord
    has_many :pokemons
    has_many :comments
    has_many :commented_pokemon, through: :comments #Ali added 1/1/2022. Further research needed. 

    has_secure_password #gives uthenticate, validate password & confirm - for password digest & 
    
    validates :username, :email, presence: true

end
