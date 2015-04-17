desc "manage edi"

namespace :edi do
  namespace :start do

    task :catpen do
      on roles(:app) do
        within current_path do
          execute "docker", "run -d --name edi --restart always catpen-edi"
        end
      end
    end

    after "docker:build:dogfort", :catpen

    task :dogfort do
      on roles(:app) do
        within current_path do
          execute "docker", "run -d --name dogfort --restart always dogfort-edi"
        end
      end
    end

    after "edi:start:catpen", :dogfort

  end

  namespace :stop do

    task :catpen do
      on roles(:app) do
        within current_path do
          execute "docker", "stop edi"
          execute "docker", "rm edi"
        end
      end
    end

    task :dogfort do
      on roles(:app) do
        within current_path do
          execute "docker", "stop dogfort"
          execute "docker", "rm dogfort"
        end
      end
    end

  end
end
