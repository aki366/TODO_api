class Comment < ApplicationRecord
  validates :text, {presence: true, length: {maximum: 1000}}

  belongs_to :todo
end
