class Receiver < ApplicationRecord
  PAYMENT = ['Qonto','Shine','Spendesk','Manager-One']
  EXPENSE = ['Expensya','Rydoo','Concur','Jenji','Expensify']

  belongs_to :user
  has_many :receipts, dependent: :destroy
end
