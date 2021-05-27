class Plant < ApplicationRecord
  belongs_to :garden
  #@plant.garden
  validates :name, presence: true
end
