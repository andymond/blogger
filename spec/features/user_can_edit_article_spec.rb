require "rails_helper"

describe "User can edit article" do
  describe "User navigates to edit from article" do
    it "displays form for user to edit article" do
      article_1 = Article.create(title: "How to be flat", body: "Remove one dimension")
      article_2 = Article.create(title: "How to be four-dimensional", body: "Add one dimension")

      visit article_path(article_1)
      click_link("Edit Article")

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in "article[title]", with: "New Title!"
      click_on "Update Article"

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content("New Title!")
    end
  end
end
