namespace :deploy do
  desc "Upload services.yml"
  task :variables do
    on roles(:app) do
      upload! "config/services.yml", "/home/deployer/apps/edi/shared/config/services.yml"
    end
  end
end
