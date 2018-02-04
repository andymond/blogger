require "rails_helper"

describe "User sees list of all tags" do
  describe "User visits /tags" do
    it "displays list of all tags" do
      tag_1 = Tag.create(name: "funky")
      tag_2 = Tag.create(name: "fresh")
      tag_3 = Tag.create(name: "dank")

      visit "/tags"

      expect(page).to have_content(tag_1.name)
      expect(page).to have_content(tag_2.name)
      expect(page).to have_content(tag_3.name)
    end
  end
end
