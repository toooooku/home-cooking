class Refrigerator < ApplicationRecord
  belongs_to :user

  validates :foodstuff, presence: true
  validates :buy,       presence: true
end
