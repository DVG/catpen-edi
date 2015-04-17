namespace :deploy do
  task :setup_config do
    on roles(:app) do
      config_files = fetch(:config_files)
      config_files.each do |file|
        upload! "config/#{file}", "/home/deployer/apps/edi/curent/config/"
      end

    end
  end
  after :published, :setup_config
end
