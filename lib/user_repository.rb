require 'rom-repository'

class UserRepository < ROM::Repository[:users]
  commands :create, update: :by_pk, delete: :by_pk
end
