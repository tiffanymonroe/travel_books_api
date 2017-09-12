class User < ApplicationRecord
  has_secure_password
  has_many :books
  has_many :destinations

  # belongs_to :book
  # belongs_to :destination
end
