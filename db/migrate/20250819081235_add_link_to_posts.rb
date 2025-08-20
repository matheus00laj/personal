class AddLinkToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :link, :string
  end
end
