require "rails_helper"

describe "User can delete article" do
  describe "User navigates to delete article from show" do
    it "allows user to delete article" do
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
      article_2 = Article.create(title: "How to be four-dimensional", body: "Add one dimension")

      visit article_path(article_1)
      click_link("Delete Article")

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content("Article #{article_1.title} was deleted.")

    end
  end
end
