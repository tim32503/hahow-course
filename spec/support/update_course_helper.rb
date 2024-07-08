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

  def change_sequence_mutation(course_id:, chapter_id:, new_chapter_sequence:)
    <<~GRAPHQL
      mutation {
        updateCourse(input: {
          input: {
            id: #{course_id},
            chapters: [
              {
                id: #{chapter_id},
                sequence: #{new_chapter_sequence}
              }
            ]
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
              sequence
              units {
                id
                name
                description
                content
                sequence
              }
            }
          }
          errors
        }
      }
    GRAPHQL
  end
end
