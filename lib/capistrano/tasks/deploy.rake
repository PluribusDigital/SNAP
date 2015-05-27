namespace :deploy do

  desc "Create symbolic link for nginx app folder"
  task :create_app_link do
    on roles(:app) do
      execute "ln -s /var/www/#{fetch(:application)} /var/www/app"
    end
  end
  
  desc "Install Bower"
  task :bower_install do
    on roles(:app) do
      within fetch(:release_path) do
	    execute :rake, "bower:install"
      end
	end
  end

  
  desc "Setup database"
  task :db_setup do
    on roles(:app) do
	  within fetch(:release_path) do
	    with rails_env: fetch(:stage) do
          execute :rake, "db:reset"
          execute :rake, "pop"
		end
	  end
	end
  end
end