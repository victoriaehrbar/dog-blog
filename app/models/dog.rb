class Dog < ApplicationRecord
  belongs_to :breed

  has_many :updates, dependent: :destroy
  has_many :users, through: :updates

  validates :dog_name, presence: true
end
