require 'rails_helper'

describe "New paper page", type: :feature do
  title = "How to use a broom without hurting yourself"
  venue = "Hogwarts"
  year = 1996

  it "should render withour error" do
    visit new_paper_path
  end

  it "should save papers" do
    papers = Paper.count
    visit new_paper_path

    page.fill_in "paper[title]", with: title
    page.fill_in "paper[venue]", with: venue
    page.fill_in "paper[year]", with: year
    find('input[type="submit"]').click

    expect(Paper.count).to be(papers + 1)
    expect(Paper.exists?(title: title, venue: venue, year: year)).to be true
  end

  it "should not safe papers without title" do
    papers = Paper.count
    visit new_paper_path

    page.fill_in "paper[venue]", with: venue
    page.fill_in "paper[year]", with: year
    find('input[type="submit"]').click

    expect(Paper.count).to be(papers)
  end

  it "should not safe papers without venue" do
    papers = Paper.count
    visit new_paper_path

    page.fill_in "paper[title]", with: title
    page.fill_in "paper[year]", with: year
    find('input[type="submit"]').click

    expect(Paper.count).to be(papers)
  end

  it "should not safe papers without year" do
    papers = Paper.count
    visit new_paper_path

    page.fill_in "paper[venue]", with: venue
    page.fill_in "paper[title]", with: title
    find('input[type="submit"]').click

    expect(Paper.count).to be(papers)
  end

  it "should not safe papers when year is not a number" do
    papers = Paper.count
    visit new_paper_path

    page.fill_in "paper[venue]", with: venue
    page.fill_in "paper[title]", with: title
    page.fill_in "paper[year]", with: "year"
    find('input[type="submit"]').click

    expect(Paper.count).to be(papers)
  end

end