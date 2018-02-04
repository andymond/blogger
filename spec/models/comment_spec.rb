require "rails_helper"

describe Comment, type: :model do
  describe "Relationships" do
    it {should belong_to(:article)}
  end
end
