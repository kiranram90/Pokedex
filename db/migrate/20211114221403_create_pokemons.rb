class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :title
      t.text :category
      t.belongs_to :trainer, null: false, foreign_key: true
  
      t.timestamps
    end
  end
end
