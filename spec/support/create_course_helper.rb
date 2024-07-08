# frozen_string_literal: true

module CreateCourseHelper
  def good_mutation
    faker_title = Faker::Educator.course_name
    faker_name = Faker::Name.name
    faker_description = Faker::Lorem.sentence

    <<~GRAPHQL
      mutation {
        createCourse(input: {
          input: {
            name: "#{faker_title}",
            lecturerName: "#{faker_name}",
            description: "#{faker_description}",
            chapters: [
              {
                name: "#{faker_title}",
                units: [
                  {
                    name: "#{faker_title}",
                    description: "#{faker_description}",
                    content: "#{faker_description}"
                  }
                ]
              }
            ]
          }
        }) {
          course {
            name
            lecturerName
            description
            chapters {
              name
              units {
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

  def bad_mutation
    <<~GRAPHQL
      mutation {
        createCourse(input: {
          input: {
            name: "測試課程"
          }
        }) {
          course {
            name
            lecturerName
            description
            chapters {
              name
              units {
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

  def full_mutation
    faker_title = Faker::Educator.course_name
    faker_name = Faker::Name.name
    faker_description = Faker::Lorem.sentence

    <<~GRAPHQL
      mutation {
        createCourse(input: {
          input: {
            name: "#{faker_title}",
            lecturerName: "#{faker_name}",
            description: "#{faker_description}",
            chapters: [
              {
                name: "#{faker_title}",
                units: [
                  {
                    name: "#{faker_title}",
                    description: "#{faker_description}",
                    content: "#{faker_description}"
                  }
                ]
              }
            ]
          }
        }) {
          course {
            name
            lecturerName
            description
            chapters {
              name
              units {
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

  def full_mutation_with_sequence
    faker_title = Faker::Educator.course_name
    faker_name = Faker::Name.name
    faker_description = Faker::Lorem.sentence

    <<~GRAPHQL
      mutation {
        createCourse(input: {
          input: {
            name: "#{faker_title}",
            lecturerName: "#{faker_name}",
            description: "#{faker_description}",
            chapters: [
              {
                name: "CHAPTER 1",
                sequence: 2,
                units: [
                  {
                    name: "UNIT 1",
                    description: "#{faker_description}",
                    content: "#{faker_description}",
                    sequence: 3
                  },
                  {
                    name: "UNIT 2",
                    description: "#{faker_description}",
                    content: "#{faker_description}",
                    sequence: 1
                  },
                  {
                    name: "UNIT 3",
                    description: "#{faker_description}",
                    content: "#{faker_description}",
                    sequence: 2
                  }
                ]
              },
              {
                name: "CHAPTER 2",
                sequence: 1,
                units: [
                  {
                    name: "#{faker_title}",
                    description: "#{faker_description}",
                    content: "#{faker_description}"
                  }
                ]
              }
            ]
          }
        }) {
          course {
            name
            lecturerName
            description
            chapters {
              name
              sequence
              units {
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

  def empty_name_mutation
    faker_name = Faker::Name.name
    faker_description = Faker::Lorem.sentence

    <<~GRAPHQL
      mutation {
        createCourse(input: {
          input: {
            name: "",
            lecturerName: "#{faker_name}",
            description: "#{faker_description}"
          }
        }) {
          course {
            name
            lecturerName
            description
            chapters {
              name
              units {
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
