class User < ApplicationRecord
  has_secure_password
  belongs_to :book
  belongs_to :destination
end
