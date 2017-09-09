class Book < ApplicationRecord
  has_many :linkers
  has_many :destinations, through: :linkers
end
