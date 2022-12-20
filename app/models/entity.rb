class Entity < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
