#
# Composer tasks
#

namespace :composer do

    desc "Run composer install in release_path."
    task :update do
        on roles(:all) do
            within release_path do
                target = fetch('vendor/composer', release_path)
                if test "[ -d #{target} ]"
                    execute "composer", "update", "-o" 
                else
                    execute "composer", "install", "-o"
                end
            end
        end
    end
end 
