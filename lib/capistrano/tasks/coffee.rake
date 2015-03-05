#
# Display somethings
#

namespace :coffee do

  task :make do
  	on roles(:app), in: :sequence, wait: 5 do
		
  		exec = fetch(:end_exec)
	    puts "Execution time : #{exec} seconds"
	    
	end

  end

end