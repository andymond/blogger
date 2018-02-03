require "rails_helper"

describe "User navigates to create article" do
  describe "User navigate to create article from index" do
    it "displays form to create new article" do
      visit articles_path
      click_link "Create New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"
      click_on "Create Article"

      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
    end
  end
end
