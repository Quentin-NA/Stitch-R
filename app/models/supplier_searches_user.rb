class SupplierSearchesUser < ApplicationRecord
  belongs_to :user
  belongs_to :supplier_search
end