FactoryBot.define do
  factory :comment do
    text { nil }
    association :author, factory: :user
    association :post, factory: :post
  end
end
