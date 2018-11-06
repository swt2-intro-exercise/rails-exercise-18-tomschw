FactoryBot.define do
  factory :paper do
    title { "COMPUTING MACHINERY AND INTELLIGENCE" }
    venue { "Mind 49: 433-460" }
    year { 1950 }
    authors {build_list :author, 1}
  end

  factory :another_paper, class: Paper do
    title { "Paper" }
    venue { "backstage" }
    year { 1968 }
    authors {build_list :another_author, 1}
    end
end
