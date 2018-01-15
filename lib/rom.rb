require 'rom-sql'

CONTAINER = ROM.container(:sql, 'sqlite://db/development.db') do |config|
  config.relation(:users) do
    schema(infer: true)
  end
end
