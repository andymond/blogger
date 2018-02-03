require "rails_helper"

describe "User navigates to article show page" do
  describe "User navigates to article from index" do
    it "displays that article's information" do
      article = Article.create(title: "How to shave a mermaid", body: "Don't do it!")

      visit articles_path
      click_link article.title

      expect(current_path).to be("/articles/1")
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
