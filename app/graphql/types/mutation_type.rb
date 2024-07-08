# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_course, mutation: Mutations::CreateCourse
  end
end
