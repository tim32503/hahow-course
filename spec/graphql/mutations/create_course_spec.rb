# frozen_string_literal: true

require 'rails_helper'
require 'support/create_course_helper'

RSpec.describe '新增課程 API', type: :request do
  include CreateCourseHelper

  describe '#resolve' do
    it '課程新增成功' do
      post '/graphql', params: { query: good_mutation }

      json = JSON.parse(response.body)

      expect(json['data']).to be_present
      expect(json['errors']).to be_nil
    end

    it '因 GraphQL 驗證參數失敗，新增課程失敗' do
      post '/graphql', params: { query: bad_mutation }

      json = JSON.parse(response.body)

      expect(json['errors']).to be_present
    end

    describe '驗證條件' do
      it '課程、章節和單元需要同時被建立' do
        post '/graphql', params: { query: full_mutation }

        json = JSON.parse(response.body)

        data = json['data']
        course_data = data['createCourse']['course']
        chapters_data = course_data['chapters']
        units_data = chapters_data[0]['units']

        expect(data).to be_present
        expect(json['errors']).to be_nil
        expect(course_data).to include('chapters')
        expect(chapters_data).to be_present
        expect(chapters_data.first).to include('units')
        expect(units_data).to be_present
      end

      it '需要驗證使用者的輸入並在儲存失敗時回傳錯誤訊息' do
        post '/graphql', params: { query: empty_name_mutation }

        json = JSON.parse(response.body)
        data = json['data']['createCourse']['errors']

        expect(data).to be_present
        expect(data).to eq(["Validation failed: Name can't be blank"])
      end
    end
  end
end
