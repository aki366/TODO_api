class Todo < ApplicationRecord
  validates :text, presence: true, length: { maximum: 140 }

  has_many :comments, dependent: :destroy
end
