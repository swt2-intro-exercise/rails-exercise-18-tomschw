require 'rails_helper'

 describe "Index author page", type: :feature do

    before do
          @authors = []
          @authors << (FactoryBot.create :author)
          @authors << (FactoryBot.create :another_author)
      end

     it "should list all author names and homepages" do

         visit authors_path
         @authors.each do |author|
             expect(page).to have_text author.first_name
             expect(page).to have_text author.last_name
             expect(page).to have_link href: author.homepage
             expect(page).to have_link href: author_path(author)
         end
     end

     it "should have a link to create author" do
              visit authors_path
              expect(page).to have_link href: new_author_path
          end

     it "should have a heading for the name column" do
         visit authors_path
         expect(page).to have_css("th", text: "Name")
     end

    it "should link to every author's edit page" do
              visit authors_path
              @authors.each do |author|
                  expect(page).to have_link href: edit_author_path(author)
              end
          end

    it "should have a delete link for every author" do
             visit authors_path
             @authors.each do |author|
                 expect(page).to have_css("a[data-method='delete'][href='/authors/#{author.id}']")
             end
         end

    it "can delete an author" do
             author = @authors[1]
             id = author.id
             visit authors_path
             find("a[data-method='delete'][href='/authors/#{author.id}']").click

             expect(Author.exists?(id: id)).to eq false
         end

 end