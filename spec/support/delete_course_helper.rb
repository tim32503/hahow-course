# frozen_string_literal: true

module DeleteCourseHelper
  def delete_course_mutation(id)
    <<~GQL
      mutation {
        deleteCourse(input: { id: #{id} }) {
          success
          errors
        }
      }
    GQL
  end
end
