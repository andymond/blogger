require "rails_helper"

describe Tag, type: :model do
  describe "Relationships" do
    it {should have_many :taggings}
    it {should have_many(:articles).through(:taggings)}
  end
  describe "Instance Methods" do
    describe "#to_s" do
      it "returns name of tag" do
        article = Article.create(title: "one", body: "body one")
        article.tags.create(name: "1")
        article.tags.create(name: "2")

        expect(article.tags.first.to_s).to eq("1")
        expect(article.tags.last.to_s).to eq("2")  
      end
    end
  end
end
