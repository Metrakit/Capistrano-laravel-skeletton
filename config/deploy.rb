# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'minetop'
set :repo_url, 'git@github.com:Metrakit/l5-template.git'

set :branch, fetch(:branch, "minetop")

set :ssh_options, {
  forward_agent: true,
  paranoid: true,
  keys: "~/.ssh/id_rsa.pub"
}

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/minetop/v2'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
 set :linked_dirs, fetch(:linked_dirs, []).push('storage')

#set :linked_dirs, fetch(:linked_dirs, []).push('vendor')

set :exec_time, Time.now

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5