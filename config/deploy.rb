# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'my_app_name'
set :repo_url, 'git@bitbucket.org:Metrakit/minetopv2.git'

set :ssh_options, { 
  forward_agent: true, 
  paranoid: true, 
  keys: "~/.ssh/id_rsa.pub" 
}

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/dev/video'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


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


namespace :deploy do

  after :publishing, "composer:install"

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc "Permissions"
  task :permissions do
    on roles(:app) do
          within release_path  do
              execute :chmod, "-R 777 app/storage/cache"
              execute :chmod, "-R 777 app/storage/logs"
              execute :chmod, "-R 777 app/storage/meta"
              execute :chmod, "-R 777 app/storage/sessions"
              execute :chmod, "-R 777 app/storage/views"
              execute :chmod, "-R 777 public/cdn"
          end
      end
    end
    

  after :publishing, :permissions

end
