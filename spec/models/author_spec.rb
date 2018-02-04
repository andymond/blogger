require 'rails_helper'

describe Author, type: :model do
  describe "Validations" do
    it {should validate_confirmation_of(:password)}
  end
end
