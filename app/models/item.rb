class Item < ApplicationRecord
  belongs_to :category

  delegate :genre, to: :category
end