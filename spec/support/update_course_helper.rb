# frozen_string_literal: true

module UpdateCourseHelper
  def good_mutation(id)
    <<~GRAPHQL
      mutation {
        updateCourse(input: {
          input: {
            id: #{id},
            name: "#{Faker::Educator.course_name}"
          }
        }) {
          course {
            id
            name
            lecturerName
            description
            chapters {
              id
              name
              units {
                id
                name
                description
                content
              }
            }
          }
          errors
        }
      }
    GRAPHQL
  end

  def blank_name_mutation(id)
    <<~GRAPHQL
      mutation {
        updateCourse(input: {
          input: {
            id: #{id},
            name: ""
          }
        }) {
          course {
            id
            name
            lecturerName
            description
            chapters {
              id
              name
              units {
                id
                name
                description
                content
              }
            }
          }
          errors
        }
      }
    GRAPHQL
  end
end
