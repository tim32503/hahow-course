# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chapter, type: :model do
  context 'associations' do
    it { should belong_to(:course) }
    it { should have_many(:units).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
