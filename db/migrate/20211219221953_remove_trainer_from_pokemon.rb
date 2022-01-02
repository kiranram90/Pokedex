class RemoveTrainerFromPokemon < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :trainer_id 
  end
end
