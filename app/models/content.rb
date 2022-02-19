class Content < ApplicationRecord
  validates :title_id, uniqueness: true
end
