namespace :radiant do
  namespace :extensions do
    namespace :french_dates do

      desc "Runs the migration of the French Dates extension"
      task :migrate => :environment do
	require 'radiant/extension_migrator'
	if ENV["VERSION"]
	  FrenchDatesExtension.migrator.migrate(ENV["VERSION"].to_i)
	else
	  FrenchDatesExtension.migrator.migrate
	end
      end

    end
  end
end
