class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :supplier_search
  has_many :reveivers
end
