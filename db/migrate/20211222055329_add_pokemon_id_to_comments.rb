class AddPokemonIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :pokemon_id, :integer
    add_foreign_key :comments, :pokemons
  end
end
