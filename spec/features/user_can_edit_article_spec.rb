require "rails_helper"

describe "User can edit article" do
  describe "User navigates to edit from article" do
    it "displays form for user to edit article" do
      visit new_author_path
      fill_in "Username", with: "Larry"
      fill_in "Email", with: "Larry@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create Author"

      visit login_path
      fill_in "Email", with: "Larry@example.com"
      fill_in "Password", with: "password"
      click_on "Login"

      expect(page).to have_content("Logged in successfully.")

      article_1 = Article.create(title: "How to be flat", body: "Remove one dimension")

      visit article_path(article_1)
      click_link("Edit Article")

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in "article[title]", with: "New Title!"
      click_on "Update Article"

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content("New Title!")
      expect(page).to have_content("Article New Title! was updated.")
    end
  end
end
