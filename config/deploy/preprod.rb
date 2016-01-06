set :stage, :preprod

server 'example.com', user: 'login', password: 'P@$$w0rd', roles: %w{web app}

namespace :deploy do

  fetch(:migrate_question)
  fetch(:seed_question)

  # after :updated, "folder:create"

  # after :updated, "environment:prepare"

  # composer
  after :updated, "composer:install"

  # assets
  after :updated, "npm:install"
  after :updated, "bower:install"
  after :updated, "gulp:build"

  # artisan
  after :updated, "artisan:optimize"

  # databe migration and seeds
  after :updated, "artisan:migrate"
  after :updated, "artisan:seed"

  # permissions (chmod)
  after :updated, "permission:authorize"

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
