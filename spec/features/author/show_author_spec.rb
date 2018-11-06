require 'rails_helper'

describe "Single author page", type: :feature do
  before :each do
    @author = FactoryBot.create :author
  end

  it "should deliver the page" do
    visit author_path(@author)

    expect(page).to have_text @author.first_name
    expect(page).to have_text @author.last_name
    expect(page).to have_link href: @author.homepage
  end

end