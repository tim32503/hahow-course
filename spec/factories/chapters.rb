# frozen_string_literal: true

FactoryBot.define do
  factory :chapter do
    name { Faker::Educator.course_name }
    course
  end
end
