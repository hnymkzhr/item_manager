class Category < ApplicationRecord
  belongs_to :genre
  has_many :items, dependent: :destroy
  end