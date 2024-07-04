# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, presence: true
  validates :lecturer_name, presence: true
end
