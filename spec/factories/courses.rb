# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    lecturer_name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
  end
end
