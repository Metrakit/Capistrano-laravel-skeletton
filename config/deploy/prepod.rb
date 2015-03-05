set :stage, :preprod

server 'example.com', user: 'login', password: '', roles: %w{web app}

# Set the method build build the assets
set :grunt_build, 'prepod'


namespace :deploy do

  after :updated, "folder:create"

  # composer
  after :updated, "composer:update"

  # permissions (chmod)
  after :updated, "permission:authorize"

  # artisan
  after :updated, "artisan:optimize"
  after :updated, "artisan:migrate"
  after :updated, "artisan:seed"

  # assets
  after :updated, "npm:update"
  after :updated, "bower:update"
  after :updated, "grunt:build"

  # clear cache
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finished, "coffee:make"

end
