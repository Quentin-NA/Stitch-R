class SupplierSearchesUser < ApplicationRecord
  belongs_to :user
  belongs_to :supplier_search

  validates :user, uniqueness: { scope: :supplier_search}
end
