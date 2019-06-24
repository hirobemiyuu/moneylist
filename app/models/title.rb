class Title < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length:{maximum:30}
  validates :status, inclusion: { in: [true, false] }
  has_many :items, dependent: :destroy
  has_many :coments, dependent: :destroy
  
  def total_fee
    self.items.pluck(:price).sum
  end
  
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
