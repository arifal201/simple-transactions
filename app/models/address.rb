class Address < ApplicationRecord
  belongs_to :customer

  attribute :phone, :string
end
