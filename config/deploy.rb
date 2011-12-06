require 'bundler/capistrano'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :user, "perpetuate"

set :application, "perpetuate"
set :repository,  "git@github.com:jamsea/perpetuate.git"
set :scm, :git
set :branch, 'master'
set :git_shallow_clone, 1
set :deploy_via, :remote_cache
set :copy_compression, :bz2
set :rails_env, 'production'
set :deploy_to, "/home/perpetuate/#{application}"

role :web, "perpetuate.dreamhosters.com"                          # Your HTTP server, Apache/etc
role :app, "perpetuate.dreamhosters.com"                          # This may be the same as your `Web` server
role :db,  "perpetuate.dreamhosters.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
