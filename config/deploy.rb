lock '3.4.0'

set :application, 'edi'
set :repo_url, 'https://github.com/DVG/catpen-edi'
set :deploy_to, "~/apps/#{fetch(:application)}"
set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'
set :ssh_options, { :forward_agent => true }
set :linked_dirs, %w{log}

set(:config_files, %w(
   catpen-services.yml
   dogfort-services.yml
))
