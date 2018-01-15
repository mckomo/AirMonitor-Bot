ROM::SQL.migration do
  change do
    create_table(:users) do
      primary_key :id

      column :state, String, null: false
      column :station_code, String
      column :messenger_id, String, null: false

      index :messenger_id
    end
  end
end
