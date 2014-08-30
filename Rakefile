# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :import do
  desc "Import card mechanics"
  task mechanics: :environment do
    CardImporter.new.import_mechanics
  end

  desc "Import cards" 
  task cards: :environment do
    CardImporter.new.import_cards
  end
end
