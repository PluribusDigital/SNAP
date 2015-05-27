namespace :deploy do

	desc "Create symbolic link for nginx app folder"
	task :create_app_link do
		on roles(:app) do
			execute "ln -s /var/www/#{fetch(:application)} /var/www/app"
		end
	end
end