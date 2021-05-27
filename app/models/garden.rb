class Garden < ApplicationRecord
  has_many :plants, dependent: :destroy #if i delete a garden instance, it will delete all the plants attached to it.
end

