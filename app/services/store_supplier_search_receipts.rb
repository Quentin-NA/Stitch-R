class StoreSupplierSearchReceipts

# 1 - run supplier search => build (query) from SupplierSearch.new
# 2 - list message (gmail api) => GmailApi::ListUserMessages.new(user).call(query) => list of user messages (with gmail_id)
# 3 - get message for each (gmail api) => GmailApi::GetUserMessage.call(@metadatas[]) => for each msg, get receipt params (@metadata)
# 4 - transform each api response in hash => @headers.map {|header| [header.name, header.value]}.to_h
# 5 - save to db (receipts) => Receipt.create (receipt_params)

  def initialize(user, supplier_search)
    @user = user
    @supplier_search = supplier_search
  end

  def call
    query = @supplier_search.query
    gmail_messages = GmailApi::ListUserMessages.new(@user).call(query)
    return if gmail_messages.nil?
    gmail_messages.each do |message|
      content = GmailApi::GetUserMessage.new(@user, message.id)
                                        .call#(format: 'metadata',
                                              #metadata_headers: ["From", "Date", "Subject"])
      headers = content.payload.headers.map do |header|
        [header.name, header.value]
      end.to_h

      if content.payload.parts.present?
        filenames = content.payload.parts.map do |part|
          part.filename if part.filename.present?
        end.compact
      end

      unless Receipt.find_by(gmail_id: message.id)
        receipt = Receipt.create!(
          user: @user,
          gmail_id: message.id,
          from: headers["From"],
          send_date: headers["Date"],
          subject: headers["Subject"],
          supplier_search: @supplier_search,
          snippet: content.snippet,
          status: "new",
          attachment_names: filenames
        )
      end
    end
  end
end
