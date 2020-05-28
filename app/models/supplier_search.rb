class SupplierSearch < ApplicationRecord
  CATEGORY = ['Transport', 'Alimentation','Fournitures']
  LABEL = ['Tous les messages', 'Boîte de réception','Messages non lus', 'Messages envoyés']
  has_many :receipts
end
