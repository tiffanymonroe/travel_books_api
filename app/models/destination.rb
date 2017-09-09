class Destination < ApplicationRecord
  has_many :linkers
  has_many :books, through: :linkers
end
