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
  
end