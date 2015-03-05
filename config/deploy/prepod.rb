set :stage, :preprod

server 'jordane.net', user: 'fxwr2205', password: '0uTyHG78@g', roles: %w{web app}

# Set the method build build the assets
set :grunt_build, 'prepod'


namespace :deploy do

  after :updated, "folder:create"

  after :updated, "environment:prepare"

  # composer
  after :updated, "composer:update"

  # assets
  after :updated, "npm:update"
  after :updated, "bower:update"
  after :updated, "grunt:build"

  # artisan
  after :updated, "artisan:optimize"

  # permissions (chmod)
  after :updated, "permission:authorize"

  # databe migration and seeds
  after :updated, "artisan:migrate"
  after :updated, "artisan:seed"
  after :updated, "artisan:migrate_packages"
  after :updated, "artisan:seed_packages"  

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
