#
# Change permissions
#
#
namespace :permission do

	desc "Setup permissions"
	  task :authorize do
	    on roles(:app), in: :sequence, wait: 5 do
	      within release_path do
	        execute :chmod, "-Rf 755 app/storage"
	        execute :chmod, "-R o+w app/storage"
	        execute :chmod, "775 #{release_path}/.env.php"
	     end
	   end
	 end

end