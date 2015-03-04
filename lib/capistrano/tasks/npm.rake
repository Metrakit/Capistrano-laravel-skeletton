#
# Setup node modules
#

namespace :npm do

  task :install do
    on roles(:app), in: :sequence, wait: 5 do
      within fetch(:assets_path, release_path) do
        execute :npm, 'install'
      end
    end
  end

end