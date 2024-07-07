# frozen_string_literal: true

FactoryBot.define do
  factory :unit do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
    chapter
  end
end

