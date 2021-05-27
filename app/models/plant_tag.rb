class PlantTag < ApplicationRecord
  belongs_to :tag
  belongs_to :plant

  validates :tag, uniqueness: { scope: :plant, message: "already added, not this time 🥭" }
end
