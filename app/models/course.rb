# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :chapters, dependent: :destroy

  validates :name, presence: true
  validates :lecturer_name, presence: true
end
