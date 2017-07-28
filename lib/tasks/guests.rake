namespace :guests do
  desc "Remove guest accounts more than a week old."
  user_product :cleanup => :environment do
    User.where(guest: :true).where("created_at < ?", 1.week.ago).destroy_all
  end
end