class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :topic
      t.text :description
      t.integer :order

      t.timestamps
    end
  end
end
