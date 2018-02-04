require "rails_helper"

describe "User visits tag show page" do
  describe "User navigates to tag show from article" do
    it "displays tag information" do
      article = Article.create(title: "7-11", body: "Slurpees are good")
      tag = Tag.create(name: "silly")
      article.tags << tag

      visit article_path(article)
      click_link tag.name

      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_content(tag.name)
    end
  end
end
