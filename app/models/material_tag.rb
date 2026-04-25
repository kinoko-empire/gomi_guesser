class MaterialTag < ApplicationRecord
  validates :material_name, presence: true, uniqueness: { case_sensitive: false }

  def display_name_mapping
    {
      cardboard: "Cardboard",
      foam: "Foam",
      metal: "Metal",
      organic_waste: "Organic waste",
      paper: "Paper",
      pet_plastic: "PET plastic",
      plastic: "Plastic",
      uncategorized: "Uncategorized"
    }
  end

  def display_name
    display_name_mapping[self.material_name.parameterize.underscore.to_sym]
  end
end
