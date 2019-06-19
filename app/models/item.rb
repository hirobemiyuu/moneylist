class Item < ApplicationRecord
  belongs_to :title
  
  validates :day, presence: true, length: {maximum:5}
  validates :place, presence: true, length: {maximum:30}
  validates :name, presence: true, length: {maximum:30}
  validates :price, presence: true, length: {maximum:10}
  validates :tag_1, presence: true, length: {maximum:30}
  validates :tag_2, presence: false, length: {maximum:30}
end
