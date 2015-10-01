class User
  include Lotus::Entity
  attributes :email, :name, :username, :crypted_password, :salt
end
