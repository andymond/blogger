
class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password #, message: "should match password", if: :password
end
