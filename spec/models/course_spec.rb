# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'associations' do
    it { should have_many(:chapters).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:lecturer_name) }
  end
end
