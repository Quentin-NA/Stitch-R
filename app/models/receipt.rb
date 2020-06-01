class Receipt < ApplicationRecord
  belongs_to :supplier_search
  belongs_to :user
  belongs_to :receiver, optional: true
end
