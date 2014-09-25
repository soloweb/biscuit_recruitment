root = "/home/deploy/apps/biscuit_recruitment/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.stderr.log"
stdout_path "#{root}/log/unicorn.stdout.log"

listen "/tmp/unicorn.biscuit.sock"
worker_processes 2
timeout 30