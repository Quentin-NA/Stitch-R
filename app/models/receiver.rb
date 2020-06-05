class Receiver < ApplicationRecord
  PAYMENT = ['Comptable', 'Qonto','Shine','Spendesk']
  EXPENSE = ['Expensya','Rydoo','Concur','Jenji','Expensify']

  belongs_to :user
  has_many :receipts, dependent: :destroy

  attr_accessor :accountant_name
end
