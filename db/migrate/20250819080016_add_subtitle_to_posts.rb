class AddSubtitleToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :subtitle, :string
  end
end
