class Dog < ApplicationRecord
  belongs_to :breed

  has_many :updates 
  has_many :users, through: :updates
end
