class Forward < ApplicationRecord
  belongs_to :receipt_id
  belongs_to :receiver_id
end
