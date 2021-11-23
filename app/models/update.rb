class Update < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :content, :title, :training_score, presence: true
end
