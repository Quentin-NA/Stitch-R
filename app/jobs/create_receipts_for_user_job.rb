class CreateReceiptsForUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    supplier_searches = user.supplier_searches
    supplier_searches.each do |search|
      StoreSupplierSearchReceipts.new(user, search).call
    end
  end
end
# CreateReceiptsForUserJob.perform_now(User.first.id)
# CreateReceiptsForUserJob
    # Do something later
