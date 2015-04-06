namespace :deploy do
  task :setup_config do
    on roles(:app) do
      # make the config dir
      execute :mkdir, "-p #{shared_path}/config"
      full_app_name = fetch(:application)

      config_files = fetch(:config_files)
      config_files.each do |file|
        upload! "config/#{file}", "/home/deployer/apps/edi/shared/config/"
      end

      # symlink stuff which should be... symlinked
      symlinks = fetch(:symlinks)
      symlinks.each do |symlink|
        sudo "ln -nfs #{shared_path}/config/#{symlink[:source]} #{symlink[:link]}"
      end
    end
  end
  after :published, :setup_config
end
