require 'rails_helper'

describe "Edit paper page", type: :feature do

  before do
    @paper = FactoryBot.create(:paper)
    @author = FactoryBot.create(:another_author)
  end

  it "should provide authors to select" do
    visit edit_paper_path(@paper)
    expect(page).to have_css("select[multiple]")
  end

  it "should update authors of a paper" do
    authors = @paper.authors.count
    visit edit_paper_path(@paper)
    #puts page.html
    page.select  @author.name, from: "paper[author_ids][]"
    find('input[type="submit"]').click

    @paper.reload
    expect(@paper.authors.count).to eq (authors + 1)
    expect(@paper.authors).to include(@author)
  end
end