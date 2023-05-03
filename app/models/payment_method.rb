class PaymentMethod < ApplicationRecord
  has_many :transactions, dependent: :destroy

  attribute :name, :string
end
