require 'rails_helper'

describe "Index paper page" do

  before do
    @papers = []
    @papers << FactoryBot.create(:paper)
    @papers << FactoryBot.create(:another_paper)
  end

  it "should filter papers by year" do
    visit papers_path.concat("?year=#{@papers[0].year}")

    expect(page).to have_text(@papers[0].title)
    expect(page).not_to have_text(@papers[1].title)

  end

end