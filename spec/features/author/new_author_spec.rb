require 'rails_helper'

describe "New author page", type: :feature do

  first_name = 'Alan'
  last_name = 'Turing'
  homepage = 'http://wikipedia.org/Alan_Turing'

  it "should render withour error" do
    visit new_author_path
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path

    # these are the standard names given to inputs by the form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
    expect(page).to have_css('input[type="submit"]')
  end

  it "saves an author after submitting" do
    initial_authors = Author.count
    visit new_author_path

    page.fill_in 'author[first_name]', with: first_name
    page.fill_in 'author[last_name]', with: last_name
    page.fill_in 'author[homepage]', with: homepage
    find('input[type="submit"]').click

    expect(Author.count).to be (initial_authors + 1)

    expect(Author.exists?(first_name: first_name, last_name: last_name, homepage: homepage)).to be true
  end

  it "shows errors that occured" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: first_name
    page.fill_in 'author[homepage]', with: homepage
    find('input[type="submit"]').click

    expect(page).to have_text("Last name can't be blank")
  end
  end