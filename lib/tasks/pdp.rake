# coding: utf-8
require 'csv'

namespace :pdp do
  desc "Email owners reports"
  task :email_owners_reports => :environment do
    Campaign.accepted.unfinished.where("(? - created_at::date) % 7 = 0", Time.now).each do |campaign|
      CampaignMailer.report(campaign).deliver
    end
  end
end
