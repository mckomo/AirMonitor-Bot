require 'rom-sql'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    ROM.container(:sql, ENV['DATABASE_URL'] || 'postgres://localhost/bot')
  end
end
