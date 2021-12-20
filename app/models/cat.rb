class Cat < ApplicationRecord
  validates :name, presence: true
  validates :eye_color, presence: true
end