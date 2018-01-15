require 'rom-sql'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    ROM.container(:sql, 'sqlite://db/development.db')
  end
end
