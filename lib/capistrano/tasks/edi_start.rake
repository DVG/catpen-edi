desc "start edi"
task :start_edi do
  on roles(:app) do
    within current_path do
      execute "nohup", "bundle exec edi start &"
    end
  end
end
after "deploy:finished", :start_edi
