#
# Make assets
#

namespace :grunt do

  task :build do
    on roles(:app), in: :sequence, wait: 5 do
      within fetch(:assets_path, release_path) do
        execute :grunt, fetch(:grunt_build)
      end
    end
  end

end