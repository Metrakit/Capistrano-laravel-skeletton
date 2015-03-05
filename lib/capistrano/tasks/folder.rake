#
# Folder manager
#

namespace :folder do

  task :create do
  	on roles(:app), in: :sequence, wait: 5 do

		fetch(:create_folders).each do |folder|
          target = release_path.join(folder)
          unless test "[ -d #{target} ]"
            execute :mkdir, target
          end
        end

	end
  end

end