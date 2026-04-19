class ItemRule < ApplicationRecord
  # from here - https://www.reddit.com/r/rails/comments/m7oypl/uniqueness_validation_on_two_columns_of_same_field/
  # more explanation on how the uniqueness constraint works with a scope - https://boringrails.com/tips/rails-unique-scope
  validates :item_id, uniqueness: {
    scope: %i[municipality_id material_tag_id sorting_category_id],
    message: "A rule must be unique for a given municipality, item, sorting category, and material tag combination"
  }
end
