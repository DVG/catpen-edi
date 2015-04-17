lock '3.4.0'

set :application, 'edi'
set :repo_url, 'https://github.com/DVG/catpen-edi'
set :deploy_to, "~/apps/#{fetch(:application)}"
set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'
set :ssh_options, { :forward_agent => true }
set :linked_dirs, %w{log}

set(:config_files, %w(
   services.yml
   catpen-services.yml
   dogfort-services.yml
))

set(:symlinks, [
  {
    source: "services.yml",
    link: "/home/deployer/apps/edi/current/config/services.yml"
  },
  {
    source: "catpen-services.yml",
    link: "/home/deployer/apps/edi/current/config/catpen-services.yml"
  },
  {
    source: "dogfort-services.yml",
    link: "/home/deployer/apps/edi/current/config/dogfort-services.yml"
  }
])
