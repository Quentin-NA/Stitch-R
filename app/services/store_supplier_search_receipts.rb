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
                                        .call(format: 'metadata',
                                              metadata_headers: ["From", "Date", "Subject"])
      headers = content.payload.headers.map do |header|
        [header.name, header.value]
      end.to_h

      filenames = []
      if content.payload.parts.nil?
        return
      else
        filenames << content.payload.parts.map do |part|
          part.filename
        end
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
          #attachement_id: content.payload.parts.map {|part| part.body.attachment_id}
        )
          # if content.payload.parts
          #   puts "============================================="
          #   p content.payload.parts.map {|part| part.filename if part.filename.present?}.compact
          #   puts "============================================="
          #   receipt.attachment_names = content.payload.parts.map {|part| part.filename if part.filename.present?}.compact
          # else
          #   receipt.attachment_names = []
          # end
          # receipt.save!
      end
    end
  end
end
