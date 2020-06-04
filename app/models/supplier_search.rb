class SupplierSearch < ApplicationRecord
  CATEGORY = ['Transport', 'Alimentation','Fournitures']
  LABEL = ['Tous les messages', 'Boîte de réception','Messages suivis', 'Messages envoyés', 'Messages lus', 'Messages non lus']

  has_many :supplier_searches_users, dependent: :destroy
  has_many :receipts, dependent: :destroy

  has_many :users, through: :supplier_searches_users

  def query
    query = []

    query << "in:#{label} " if label.present?
    query << "from:(#{from}) " if from.present?
    query << "subject:(#{subject}) " if subject.present?
    query << "#{contains} " if contains.present?
    query << "#{not_contains} " if not_contains.present?
    query << "after:#{start_date.strftime('%Y/%m/%d')} "
    # query << "before:#{end_date.strftime('%Y/%m/%d')} " if !end_date.today?
    query << "has:attachment" if attachment.present?

    query.join
  end
end
