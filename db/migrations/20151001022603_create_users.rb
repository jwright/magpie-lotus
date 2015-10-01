Lotus::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :email,              String, null: false
      column :username,           String, null: false
      column :name,               String
      column :crypted_password,   String
      column :salt,               String
    end
  end
end
