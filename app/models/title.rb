class Title < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length:{maximum:30}
  has_many :items, dependent: :destroy
end
