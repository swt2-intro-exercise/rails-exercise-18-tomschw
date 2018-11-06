require 'rails_helper'

 describe "Index author page", type: :feature do

     it "should list all author names and homepages" do
         authors = []
         authors << (FactoryBot.create :author)
         authors << (FactoryBot.create :another_author)

         visit authors_path
         authors.each do |author|
             expect(page).to have_text author.first_name
             expect(page).to have_text author.last_name
             expect(page).to have_link href: author.homepage
             expect(page).to have_link href: author_path(author)
         end
     end

     #it "should have a link to create author" do
     #    visit authors_path
     #    expect(page).to have_link(new_author_path)
     #end

     it "should have a heading for the name column" do
         visit authors_path
         expect(page).to have_css("th", text: "Name")
     end

 end