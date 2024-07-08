# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '新增課程 API', type: :request do
  describe '#resolve' do
    it '課程新增成功' do
      post '/graphql', params: { query: good_mutation }

      json = JSON.parse(response.body)

      expect(json['data']).to be_present
    end

    it '新增課程失敗' do
      post '/graphql', params: { query: bad_mutation }

      json = JSON.parse(response.body)

      expect(json['errors']).to be_present
    end
  end

  private

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
        }
      }
    GRAPHQL
  end
end
