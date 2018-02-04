require "rails_helper"

describe "User navigates to create article" do
  describe "User navigate to create article from index" do
    it "displays form to create new article" do
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

      click_link "Create New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"
      fill_in "article[tag_list]", with: "ruby, technology"
      click_on "Create Article"

      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
      expect(page).to have_content("Article New Title! was created.")
      expect(page).to have_content("ruby, technology")
    end
  end
end
