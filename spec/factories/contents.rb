FactoryBot.define do
  factory :content do
    comment { "test" }
    infoJSON { "{\"id\":1, \"title\": \"test\", \"released_on\":\"2022-winter\"}" }
    sequence(:title_id) { |n| n }
  end
end
