class SortingCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def display_name_mapping
    {
      recyclable_plastic: "Recyclable plastic",
      recyclable_plastic_bottle: "Recyclable plastic bottle",
      recyclable_glass_bottle: "Recyclable glass bottle",
      recyclable_can: "Recyclable can",
      recyclable_paper: "Recyclable paper",
      combustible: "Combustible",
      non_combustible: "Non-combustible"
    }
  end

  def display_name
    # got the "parameterize" method call from https://stackoverflow.com/questions/2004491/convert-string-to-symbol-able-in-ruby
    display_name_mapping[self.name.parameterize.underscore.to_sym]
  end

  def self.get_display_name(name)
    display_name_mapping(name.parameterize.underscore.to_sym)
  end
end
