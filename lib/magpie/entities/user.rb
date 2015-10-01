class User
  include Lotus::Entity
  include Lotus::Validations

  attributes :email, :name, :username, :crypted_password, :salt
end
