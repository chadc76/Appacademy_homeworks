class Cat < ApplicationRecord
  validates :name, presence: true

  has_many :toys,  as: :toyable, dependent: :destroy
end
