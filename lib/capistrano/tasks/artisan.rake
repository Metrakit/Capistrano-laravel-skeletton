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
	    end
	  end
	end

	desc "Migration task"
		task :migrate do
			on roles(:app), in: :sequence, wait: 5 do
				within release_path do
				execute :php, "artisan migrate"
			end
		end
	end 

	desc "Seed task"
		task :seed do
			on roles(:app), in: :sequence, wait: 5 do
				within release_path do
				execute :php, "artisan db:seed"
			end
		end
	end 

end