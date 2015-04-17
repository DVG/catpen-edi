desc "manage edi"

namespace :edi do
  task :start do
    on roles(:app) do
      within current_path do
        execute "docker", "run -d --name edi --restart always catpen-edi"
      end
    end
  end

  task :stop do
    on roles(:app) do
      within current_path do
        execute "docker", "stop edi"
        execute "docker", "rm edi"
      end
    end
  end
end
