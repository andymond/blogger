require "rails_helper"

describe "User can delete tag" do
  describe "User deletes article from show" do
    it "allows user to delete tag" do
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

      tag_1 = Tag.create(name: "radical")
      tag_2 = Tag.create(name: "tubular")

      visit tag_path(tag_1)
      click_link "Delete Tag"

      expect(current_path).to eq(tags_path)
      expect(page).to have_content(tag_2.name)
      expect(page). to have_content("#{tag_1.name} was deleted.")
    end
  end
end
