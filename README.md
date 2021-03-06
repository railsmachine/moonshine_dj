## Moonshine Delayed Job

Many Moonshine users choose DelayedJob to handle their background
processing of jobs.
Since we recommend managing DJ via God, and most God configs for DJ
are nearly the same, it seemed only appropriate to make this as easy
as possible.

### Installation

    # Rails 2
    script/plugin install git://github.com/railsmachine/moonshine_god.git --force
    script/plugin install git://github.com/railsmachine/moonshine_dj.git --force
    # Rails 3
    script/rails plugin install git://github.com/railsmachine/moonshine_god.git --force
    script/rails plugin install git://github.com/railsmachine/moonshine_dj.git --force

Configure as necessary in your moonshine.yml (or stage-specific moonshine yml):

    :dj:
      :workers: 2
      :memory_max: 300
      

Next, add the recipe to the manifests in question:

    # app/manifests/application_manifest.rb
    recipe :god
    recipe :dj

Add the `:dj` role to any servers that run DJ:

    # config/deploy/production.rb
    server 'myapp.com', :web, :dj, :db, :primary => true

### Managing DJ with God

This plugin also provides the following Capistrano tasks:

    cap god:dj:stop
    cap god:dj:start
    cap god:dj:restart
    cap god:dj:status

We recommend having DJ restart on deploy to reload code changes:

    # config/deploy.rb
    before 'god:restart', 'god:dj:stop'

### Deploying

That's it. Deploy and done!

***
Unless otherwise specified, all content copyright &copy; 2014, [Rails Machine, LLC](http://railsmachine.com)
