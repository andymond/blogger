require "rails_helper"

describe Tagging type: :model do
  describe "Relationships" do
    it {should belong_to :tag}
    it {should belong_to :article}
  end
end
