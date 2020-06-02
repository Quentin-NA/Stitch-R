namespace :supplier_search do
  desc "Create / Update Receipts"
  task :create_receipts_for_user => :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      CreateReceiptsForUserJob.perform_later(user.id)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end


