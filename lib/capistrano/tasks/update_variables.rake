namespace :deploy do
  desc "Upload variables.sh"
  task :variables do
    on roles(:app) do
      upload! "variables.sh", "/home/deployer/apps/edi/shared/config/"
    end
  end
end
