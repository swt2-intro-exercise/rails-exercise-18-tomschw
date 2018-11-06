require 'rails_helper'

describe "Edit author page", type: :feature do
  before do
    @author = FactoryBot.create :author
  end

  it "should render withour error" do
    visit edit_author_path(@author)
  end

  it "should update author's information" do
    new_first_name = "Alan Mathison"
    visit edit_author_path(@author)
    page.fill_in 'author[first_name]', with: new_first_name
    find('input[type="submit"]').click

    @author.reload
    expect(@author.first_name).to eq new_first_name
  end

end