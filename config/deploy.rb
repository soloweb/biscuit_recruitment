# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'biscuit_recruitment'
set :repo_url, 'git@github.com:soloweb/biscuit_recruitment.git'

set :deploy_user, 'deploy'

set :rbenv_ruby, '2.0.0-p451'
set :rbenv_path, '/var/opt/rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

set :linked_files, %w{config/database.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/ckeditor_assets}

set :unicorn_pid, "/home/deploy/apps/#{fetch(:application)}/current/tmp/pids/unicorn.pid"
# set :tests, ["spec"]

set(:config_files, %w(
  nginx.conf
  database.yml
  unicorn.rb
  unicorn_init.sh
))

set(:executable_config_files, %w(
  unicorn_init.sh
))

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
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  after :finishing, 'deploy:cleanup'

end

namespace :unicorn do
  desc 'Start Unicorn'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd /home/#{fetch(:deploy_user)}/apps/#{fetch(:application)}/current; bundle exec unicorn -E #{fetch(:rails_env)} -D -c config/unicorn.rb"
      execute "ps aux --sort=start_time | grep 'unicorn master' | tail -3 | head -1 | awk '{print $2}' > #{fetch(:unicorn_pid)}"

      # execute "ps aux | grep unicorn | head -n 1 | awk '{print $2}' > #{fetch(:unicorn_pid)}"
      # execute "ps aux | grep 'unicorn master' | tail -3 | head -1 | awk '{print $2}' > #{fetch(:unicorn_pid)}"
    end
  end

  desc 'Stop Unicorn'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -s TERM `cat #{fetch(:unicorn_pid)}`"
    end
  end

  desc 'Restart Unicorn'
  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
end