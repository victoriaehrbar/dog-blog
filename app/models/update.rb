class Update < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :content, :title, :training_score, presence: true

  scope :high_training_score, -> {where("training_score > 6")}
end
