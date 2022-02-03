class AddPostCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :post_count, :integer, default: 0
  end
end
