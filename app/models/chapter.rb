# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :course

  validates :name, presence: true
end
