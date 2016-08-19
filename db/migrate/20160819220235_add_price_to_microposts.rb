class AddPriceToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :price, :string
  end
end
