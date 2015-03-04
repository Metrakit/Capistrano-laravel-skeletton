#
# Change permissions
#
namespace :permission do

	desc "Setup permissions"
	  task :authorize do
	    on roles(:app), in: :sequence, wait: 5 do
	      within release_path do
	        execute :chmod, "-Rf 777 app/storage"
	     end
	   end
	 end

end