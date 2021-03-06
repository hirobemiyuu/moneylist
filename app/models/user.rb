class User < ApplicationRecord
  before_save {self.email.downcase!}
  validates :name, presence: true, length: {maximum:10}, uniqueness: {case_sensitive:true}
  validates :email, presence: true, length: {maximum:255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: {case_sensitive:false}
  has_secure_password
  
  mount_uploader :image, ImageUploader
  has_many :sharings
  has_many :titles, dependent: :destroy
end
