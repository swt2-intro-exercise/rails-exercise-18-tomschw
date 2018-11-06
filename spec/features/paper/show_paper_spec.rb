require 'rails_helper'

describe "Show paper page", type: :feature do

  it "should list the authors of a paper" do
    paper = FactoryBot.create(:paper)
    visit paper_path(paper)

    paper.authors.each do |author|
      expect(page).to have_text author.name
    end
  end
end