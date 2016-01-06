#
# Download vendors
#

namespace :bower do

  task :install do
  	on roles(:app), in: :sequence, wait: 5 do
	    within release_path do
	        execute :bower, 'install'
	    end
	end
  end

end