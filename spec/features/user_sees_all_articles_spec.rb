require "rails_helper"

describe "user sees all articles" do
  describe "the visit /articles" do
    it "displays all articles" do
      article_1 = Article.new(title:"title 1", body: "body 1")
      article_2 = Article.new(title:"title 2", body: "body 2")

      visit "/articles"

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)
    end
  end
end
