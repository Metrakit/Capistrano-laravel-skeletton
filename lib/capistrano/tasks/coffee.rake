namespace :coffee do

  task :make do
  	on roles(:app), in: :sequence, wait: 5 do
		
  		start = fetch(:exec_time)
	    puts "Execution time : #{Time.now - start} seconds"
	    
	end

  end

end