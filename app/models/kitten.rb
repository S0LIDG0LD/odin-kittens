class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cuteness, presence: true
  validates :softness, presence: true
end
