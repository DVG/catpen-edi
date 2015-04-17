namespace :docker do
  namespace :build do

    task :catpen do
      on roles(:app) do
        within current_path do
          execute "docker", "build -t catpen-edi ."
        end
      end
    end
    after "deploy:setup_config", :catpen

    task :dogfort do
      on roles(:app) do
        within current_path do
          execute "docker", "build -f Dogfortfile -t dogfort-edi ."
        end
      end
    end
    after :catpen, :dogfort


  end
end
