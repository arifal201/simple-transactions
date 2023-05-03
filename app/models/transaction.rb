class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :payment_method

  attribute :qty, :integer
end
