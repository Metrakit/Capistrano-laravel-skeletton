# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'laravel_skeletton'
set :repo_url, 'git@github.com:dlepaux/dynamix.git'

set :ssh_options, { 
  forward_agent: true, 
  paranoid: true, 
  keys: "~/.ssh/id_rsa.pub" 
}

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/dev/dynamix'

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

set :linked_dirs, fetch(:linked_dirs, []).push('dev/node_modules', 'dev/src/vendor', 'vendor')

# Set the folders to create if they dont exist
set :create_folders, fetch(:create_folders, []).push('vendor/dynamix')

set :node_dir, 'dev/node_modules'
set :bower_dir, 'dev/src/vendor'

set :exec_time, Time.now

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5


set :assets_path, -> { release_path.join('dev') }

set :migration_packages, fetch(:migration_packages, [])
set :seed_packages, fetch(:seed_packages, [])

