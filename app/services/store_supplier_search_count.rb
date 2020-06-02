class StoreSupplierSearchCount

# 1 - list all supplier.searches
# 2 - count number of user.messages per supplier.search
# 3 - transform each response in hash =>
# 4 - save to db (supplier_search_users) => requires/update+route

  def initialize(user)
    @user = user
  end

  def call
    user_searches = SupplierSearchUsers.all
    @searches_count = []
    user_searches.each do |search|
      count = GmailApi::CountUserMessages.new(@user).call(search.query)
      [search.id, search.count]
    end.to_h
    #Receipt.update
  end
end

# 2 - list message (gmail api) => GmailApi::ListUserMessages.new(user).call(query) => list of user messages (with gmail_id)
# 3 - get message for each (gmail api) => GmailApi::GetUserMessage.call(@metadatas[]) => for each msg, get receipt params (@metadata)
# 4 - transform each api response in hash => @headers.map {|header| [header.name, header.value]}.to_h
# 5 - save to db (receipts) => Receipt.create (receipt_params)
