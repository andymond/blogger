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
end
