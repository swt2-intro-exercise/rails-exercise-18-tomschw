require 'rails_helper'

describe Author, type: :model do

  it "should belong to authors" do
    paper = Paper.new
    expect(paper.respond_to? :authors).to be true
  end

end