class AddUserIdToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :user_id, :integer
  end
end
