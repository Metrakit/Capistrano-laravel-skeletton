#
# Create the file Env vars
#

namespace :environment do

  task :prepare do
  	on roles(:app), in: :sequence, wait: 5 do	
  		upload! StringIO.new(File.read("config/env/deploy.php")), "#{release_path}/.env.php"    
	end
  end

end