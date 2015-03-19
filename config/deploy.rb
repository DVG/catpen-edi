lock '3.4.0'

set :application, 'edi'
set :repo_url, 'https://github.com/DVG/catpen-edi'
set :deploy_to, "~/apps/#{fetch(:application)}"
set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'
set :ssh_options, { :forward_agent => true }
set :linked_dirs, %w{log tmp/pids tmp/sockets}

set(:config_files, %w(
  nginx.conf
  unicorn.rb
  unicorn_init.sh
))

# which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(
  unicorn_init.sh
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/sites-enabled/#{fetch(:application)}"
  },
  {
    source: "unicorn_init.sh",
    link: "/etc/init.d/unicorn_#{fetch(:application)}"
  }
])
