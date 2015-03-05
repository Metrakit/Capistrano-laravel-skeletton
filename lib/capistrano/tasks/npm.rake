#
# Setup node modules
#

namespace :npm do

  task :update do
    on roles(:app), in: :sequence, wait: 5 do
      within fetch(:assets_path, release_path) do
        target = fetch(:node_dir, release_path)
        if test "[ -d #{target} ]"
        	execute :npm, 'update'
        else
        	execute :npm, 'install'
        end      	
      end
    end
  end

end