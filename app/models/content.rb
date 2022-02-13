class Content < ApplicationRecord
  validates :comment, presence: true
end
