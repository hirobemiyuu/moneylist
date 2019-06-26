class Item < ApplicationRecord
  belongs_to :title
  
  validates :day, presence: true, length: {maximum:2}, numericality: true
  validates :place, presence: true, length: {maximum:30}
  validates :name, presence: true, length: {maximum:30}
  validates :price, presence: true, length: {maximum:10}, numericality: true
  validates :tag_1, presence: true, length: {maximum:30}
  validates :tag_2, presence: false, length: {maximum:30}

  # def title
    # Title.find_by(id: self.title_id)
  # end
  def self.search_item(status, search)
    if search && search != ""
      if status == 'tag'
        where(['tag_1 LIKE ? or tag_2 LIKE ?', "%#{search}%", "%#{search}%"])
      elsif status == 'day'
        where(['day LIKE ?', "%#{search}%"])
      elsif status == 'place'
        where(['place LIKE ?', "%#{search}%"])
      elsif status == 'name'
        where(['name LIKE ?', "%#{search}%"])
      elsif status == 'creater'
        if User.find_by(name: search)
          user = User.find_by(name: search)
          search = user.id
        end
        where(['userid LIKE ?', "%#{search}%"])
      end
    else
      all
    end
  end
end
