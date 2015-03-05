#
# Download vendors
#

namespace :bower do

  task :update do
  	on roles(:app), in: :sequence, wait: 5 do
	    within fetch(:assets_path, release_path) do
	        target = fetch(:bower_dir, release_path)
	        if test "[ -d #{target} ]"
	        	execute :bower, 'update'
	        else
	        	execute :bower, 'install'
	        end   	  
	    end 	
	end
  end

end