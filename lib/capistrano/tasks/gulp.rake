#
# Make assets
#

namespace :gulp do

  task :build do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :gulp, '--production'
      end
    end
  end

end