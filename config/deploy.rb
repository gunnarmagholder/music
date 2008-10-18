default_run_options[:pty] = true
set :application, "music"
set :repository, "git://github.com/gunnarmagholder/music.git"

role :app, "li47-91.members.linode.com"
role :web, "li47-91.members.linode.com"
role :db, "li47-91.members.linode.com", :primary => true

set :deploy_to, "/var/www/apps/#{application}"
set :scm, :git

set :branch, "master"

namespace :deploy do
  desc "restart passenger" 
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is not suitable for passenger"
    task t, :roles => :app do ; end 
  end
  
  task :after_symlink do
    %w[database.yml].each do |c|
      run "ln -nsf #{current_path}/config/#{c} /var/www/apps/music/system/config/#{c} "
    end
  end
end