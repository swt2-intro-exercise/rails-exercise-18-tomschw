require 'rails_helper'

describe "Edit author page", type: :feature do

  it "should render withour error" do
    @author = FactoryBot.create :author
    puts page.html
  end

end