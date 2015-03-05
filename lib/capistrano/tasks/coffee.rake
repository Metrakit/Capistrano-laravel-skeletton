#
# Display somethings
#

namespace :coffee do

  task :make do
  	on roles(:app), in: :sequence, wait: 5 do
		
  		exec = fetch(:end_exec)

		puts "MMMMMMMMMMMMMMMMMMMMMNmdNNdhysshysooydNMMMMMMMMMMM"
		puts "MMMMMNMMNmdhhdhysooooooooooooooooooooosyNMMMMMMMMM"
		puts "dhysooooooooooooooooosooossysssyyyyssooooydNMMMMMM"
		puts "ysoooooooooosssyyyyyyyyyyyyyyyyyyyyysooooooohMMMMM"
		puts "hyysooooooosyyyyyyyyyyyyyyyhyyhhdmmyyyysssssosdNMM"
		puts "NhyyyooooooooosyyyyhhdhhddmNmNNMMMNdhyyysoooooooyd"
		puts "MMmhyyysooooooooyhmNMMNMMMMMMMMMMMMNdssosysoooosss"
		puts "MMMMmhyyysooooooooymMMMMMMMMMMMMMhsooooooosysssssy"
		puts "MMMMMNdhyyysooooooooyhmMMMMMMNmdysssooooooossssssy"
		puts "MMMMMMMNmhyyysoooooooooymMNhsoooooosysossssssyydmN"
		puts "MMMMMMMMMNdhyyysoooooooooshysoooooooosssssssdNMMMM"
		puts "MMMMMMMMMMMNmhyyysoooooooooosysoooossssssydmMMMMMM"
		puts "MMMMMMMMMMMMMNdhyyyssooooooooosssssssshmNMMMMMMMMM"
		puts "MMMMMMMMMMMMMMMNmhyyyyooooooooosssssyhMMMMMMMMMMMM"
		puts "MMMMMMMMMMMMMMMMMNhyyyysooosssssyhdNMMMMMMMMMMMMMM"
		puts "MMMMMMMMMMMMMMMMMMMmdyyyssssssshMMMMMMMMMMMMMMMMMM"
		puts "MMMMMMMMMMMMMMMMMMMMMNhyssssydmMMMMMMMMMMMMMMMMMMM"
		puts "NNNNNNNNNNNNNNNNNNNNNNNdsydmNNNNNNNNNNNNNNNNNNNNNN"
	    puts "Execution time : #{exec} seconds"
	    
	end

  end

end