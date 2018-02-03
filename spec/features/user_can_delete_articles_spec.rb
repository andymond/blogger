require "rails_helper"

describe "User can delete article" do
  describe "User navigates to delete article from show" do
    it "allows user to delete article" do
      article_1 = Article.create(title: "How to be flat", body: "Remove one dimension")
      article_2 = Article.create(title: "How to be four-dimensional", body: "Add one dimension")

      visit article_path(article_1)
      click_link("Delete Article")

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content("Article #{article_1.title} was deleted.")

    end
  end
end
