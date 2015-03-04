#
# Composer tasks
#

namespace :composer do

    desc "Run composer install in release_path."
    task :install do
        on roles(:all) do
            within release_path do
                execute "composer", "install", "-o"
            end
        end
    end
    task :update do
        on roles(:all) do
            within release_path do
                execute "composer", "update", "-o"
            end
        end
    end
end 
