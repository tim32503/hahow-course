# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Unit, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
  end

  context 'associations' do
    it { should belong_to(:chapter) }
  end
end
