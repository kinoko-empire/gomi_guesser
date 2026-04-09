class ItemRule < ApplicationRecord
  # from here - https://www.reddit.com/r/rails/comments/m7oypl/uniqueness_validation_on_two_columns_of_same_field/
  validates :item_id, uniqueness: { scope: %i[municipality_id material_tag_id sorting_category_id] }
end
