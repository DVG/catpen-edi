namespace :docker do
  task :build do
    on roles(:app) do
      within current_path do
        execute "docker", "build -t catpen-edi ."
      end
    end
  end
  after "deploy:published", :build
end
