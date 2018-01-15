require 'rom-sql'

CONTAINER = ROM.container(:sql, ENV['DATABASE_URL'] || 'postgres://localhost/bot') do |config|
  config.relation(:users) do
    schema(infer: true)
  end
end
