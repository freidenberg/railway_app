FactoryBot.define do
  factory :comment do
    comment_content { "MyString" }
    user { nil }
    post { nil }
  end
end
