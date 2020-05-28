class SupplierSearch < ApplicationRecord
  CATEGORY = ['Transport', 'Alimentation','Fournitures']
  LABEL = ['Tous les messages', 'Boîte de réception','Messages suivis', 'Messages envoyés', 'Messages lus', 'Messages non lus']
  has_many :receipts
end
