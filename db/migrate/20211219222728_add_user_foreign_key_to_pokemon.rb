class AddUserForeignKeyToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :user_id, :integer
    add_foreign_key :pokemons, :users
  end
end
