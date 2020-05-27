class SupplierSearch < ApplicationRecord
  CATEGORY = ['Transport', 'Alimentation','Fournitures']
  has_many :receipts
end
