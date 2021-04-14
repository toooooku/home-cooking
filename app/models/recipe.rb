class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Recipe.where('title LIKE(?)', "%#{search}%")
    else
      Recipe.all
    end
  end
end
