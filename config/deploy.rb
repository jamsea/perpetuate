require 'bundler/capistrano'


default_run_options[:pty] = false
ssh_options[:forward_agent] = true
set :use_sudo, false
set :user, "perpetuate"
set :domain, 'perpetuate.dreamhosters.com'
set :project, 'perpetuate'

set :application, "perpetuate.dreamhosters.com"
set :repository,  "git@github.com:jamsea/perpetuate.git"
set :scm, :git
set :branch, 'master'
set :git_shallow_clone, 1
set :deploy_via, :remote_cache
set :copy_compression, :bz2
set :rails_env, 'production'
set :deploy_to, "/home/perpetuate/perpetuate"
set :deploy_via, :export



role :web, "#{application}"                          # Your HTTP server, Apache/etc
role :app, "#{application}"                           # This may be the same as your `Web` server
role :db,  "#{application}", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :chmod755, "app config db lib public vendor script script/* public/disp*"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
