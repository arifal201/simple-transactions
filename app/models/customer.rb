class Customer < ApplicationRecord
  has_many :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :transactions, dependent: :destroy

  attribute :name, :string
end
