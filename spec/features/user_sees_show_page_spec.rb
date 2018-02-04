require "rails_helper"

describe "User navigates to article show page" do
  describe "User navigates to article from index" do
    it "displays that article's information" do
      article = Article.create(title: "How to shave a mermaid", body: "Don't do it!")
      comment_1 = article.comments.create(authorname: "Ash", body: "All Pokemon are great")
      comment_2 = article.comments.create(authorname: "Misty", body: "Only Water Pokemon are great")

      visit articles_path
      click_link article.title

      expect(current_path).to eq("/articles/#{article.id}")
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.authorname)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.authorname)
      expect(page).to have_content(comment_2.body)
    end
  end

  describe "User fills in comment form" do
    it "displays comment on article show page" do
      article = Article.create(title: "How to be cool", body: "Keep your temperature about 10 degress under room temperature")

      visit article_path(article)

      fill_in "comment[authorname]", with: "ME!"
      fill_in "comment[body]", with: "Sounds like a bad idea!"
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("ME!")
      expect(page).to have_content("Sounds like a bad idea!")
    end
  end
end
