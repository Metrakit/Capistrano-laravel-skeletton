#
# Artisan tasks
#

namespace :artisan do

	desc "Optimize classmap"
	task :optimize do
	  on roles(:app), in: :sequence, wait: 5 do
	    within release_path do
	      execute :php, "artisan clear-compiled"
	      execute :php, "artisan optimize"

		  # end of script execution
		  start = fetch(:exec_time)
		  set :end_exec, Time.now - start

	    end
	  end
	end

	desc "Migration task"
		task :migrate do
			on roles(:app), in: :sequence, wait: 5 do
				within release_path do
				if fetch(:migrate_question) == "yes"
					execute :php, "artisan migrate --force"
				end
			end
		end
	end 

	desc "Seed task"
		task :seed do
			on roles(:app), in: :sequence, wait: 5 do
				if fetch(:seed_question) == "yes"
					within release_path do
					execute :php, "artisan db:seed --force"
				end
			end
		end
	end 

	desc "Migration task"
		task :migrate_packages do
			on roles(:app), in: :sequence, wait: 5 do
				if fetch(:migrate_p_question) == "yes"
					within release_path do
					fetch(:migration_packages).each do |migration|
			          execute :php, 'artisan migrate --path="#{migration}"'
        			end					
				end
			end
		end
	end 

	desc "Seed task"
		task :seed_packages do
			on roles(:app), in: :sequence, wait: 5 do
				if fetch(:seed_p_question) == "yes"
					within release_path do
					fetch(:seed_packages).each do |seed|
			          execute :php, 'artisan db:seed --class="#{seed}"'
        			end
				end
			end
		end
	end 

end