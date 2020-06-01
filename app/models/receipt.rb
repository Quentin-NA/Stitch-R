class Receipt < ApplicationRecord
  belongs_to :supplier_search
  belongs_to :user
  has_many :reveivers
end
