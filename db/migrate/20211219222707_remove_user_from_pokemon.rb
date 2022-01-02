class RemoveUserFromPokemon < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :user_id 
  end
end
