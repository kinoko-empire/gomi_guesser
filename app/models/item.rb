class Item < ApplicationRecord
  validates :eng_name, presence: true, uniqueness: true
end
