FactoryBot.define do
  factory :post do
    title { nil }
    text { nil }
    comments_counter { nil }
    likes_counter { nil }
    association :author, factory: :user
  end
end
