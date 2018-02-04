require "rails_helper"

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create(title: "Title 1", body: "Body 1")
      article_2 = Article.create(title: "Title 2", body: "Body 2")

      visit articles_path

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
      expect(page).to_not have_link("Create New Article")

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

      visit articles_path
      
      expect(page).to have_link("Create New Article")
    end
  end
end
