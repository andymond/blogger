require "rails_helper"

describe Article, type: :model do
  describe "Validations" do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:body)}
  end
  describe "Relationships" do
    it {should have_many(:comments)}
  end
end
