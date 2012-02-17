class RemoveOrderFromPage < ActiveRecord::Migration
  def up
    remove_column :pages, :order
  end

  def down
    add_column :pages, :order, :integer
  end
end
