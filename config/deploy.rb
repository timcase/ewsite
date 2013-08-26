require 'bundler/capistrano'
load 'deploy/assets'

set :application, "ewsite"
set :repository,  "git@github.com:timcase/ewsite.git"
set :port, 2170
set :environment, :production
set :scm, :git
set :branch, 'master'

set :deploy_to, '/var/www/ewsite'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "2drops.net", :port => port
role :app, "2drops.net", :port => port
role :db,  "2drops.net", :primary => true, :port => port
role :db,  "2drops.net", :port => port

set :user, 'deploy'
set :domain_name, '2drops.net'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:port] = port

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:cleanup", "deploy:cp_secret_token"
after "deploy:cp_secret_token", "deploy:cp_echowrap"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end


   task :cp_secret_token do
     run "cd #{release_path}/config/initializers; cp /var/www/ewsite/shared/initializers/secret_token.rb secret_token.rb;"
   end

   task :cp_echowrap do
     run "cd #{release_path}/config/initializers; cp /var/www/ewsite/shared/initializers/echowrap.rb echowrap.rb;"
   end

 end
