class Post < ApplicationRecord
  validates :title, :subtitle, presence: true
  has_rich_text :content
end
