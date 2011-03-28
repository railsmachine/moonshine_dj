namespace :god do
  namespace :dj do
    desc "start dj workers"
    task :start, :roles => :dj do
      sudo 'god start dj'
    end
    desc "stop dj workers"
    task :stop, :roles => :dj do
      sudo 'god stop dj'
    end
    desc "restart dj workers"
    task :restart, :roles => :dj do
      sudo 'god restart dj'
    end

    desc "show status of dj workers"
    task :status, :roles => :dj do
      sudo 'god status dj'
    end
  end
end
