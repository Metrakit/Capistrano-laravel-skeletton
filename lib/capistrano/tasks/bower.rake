#
# Download vendors
#

namespace :bower do

  task :install do
  	on roles(:app), in: :sequence, wait: 5 do
	    within fetch(:assets_path, release_path) do
	      execute :bower, 'install'
	    end
	end
  end

end