class Item < ApplicationRecord
  belongs_to :title
  
  validates :day, presence: true, length: {maximum:2}, numericality: true
  validates :place, presence: true, length: {maximum:30}
  validates :name, presence: true, length: {maximum:30}
  validates :price, presence: true, length: {maximum:10}, numericality: true
  validates :tag_1, presence: true, length: {maximum:30}
  validates :tag_2, presence: false, length: {maximum:30}

  def self.search_item(search)
    if search
      where(['tag_1 LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
