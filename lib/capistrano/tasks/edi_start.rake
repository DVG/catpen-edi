desc "start edi"
task :start_edi do
  execute :edi, "start &"
end
after "deploy:finished", :start_edi
