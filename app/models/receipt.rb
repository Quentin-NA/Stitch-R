class Receipt < ApplicationRecord
  belongs_to :user_id
  belongs_to :supplier_id
end
