desc "start edi"
task :start_edi do
  on roles(:app) do
    execute "bundle", "exec edi start &"
  end
end
after "deploy:finished", :start_edi
