class Sharing < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :title, optional: true
end
