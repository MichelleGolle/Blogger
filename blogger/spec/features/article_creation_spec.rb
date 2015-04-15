require 'rails_helper'

RSpec.describe "User creates an article" do
  context "with valid attributes" do
    it "saves and displays the article title" do
      visit new_article_path
      fill_in "article[title]", with: "My Article"
      fill_in "article[body]", with: "A Body"
      click_link_or_button "Create Article"
      expect(page).to have_content("My Article")
      expect(page).to have_content("A Body")
    end
  end
end

RSpec.describe "User edits an article" do
  context "with valid attributes" do
    it "saves and displays the article title and body" do
      Article.create
      visit article_path(1)
      click_link_or_button "edit"
      fill_in "article[title]", with: "Edited Title"
      fill_in "article[body]", with: "Edited Body"
      click_link_or_button "Update Article"
      expect(page).to have_content("Edited Title")
      expect(page).to have_content("Edited Body")
    end
  end
end

RSpec.describe "User deletes an article" do
  context "with valid attributes" do
    it "removes article and shows index page" do
      Article.create(title: "Something")
      visit article_path(1)
      click_link_or_button "delete"
      expect(page).to have_content("Article 'Something' Deleted!")
    end
  end
end
