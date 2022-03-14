FactoryBot.define do
  factory :content do
    comment { "test" }
    infoJSON { "{\"id\":1, \"title\": \"test\"}" }
    sequence(:title_id) { |n| n }
  end
end
