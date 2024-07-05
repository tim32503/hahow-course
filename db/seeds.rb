# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 建立課程資料

course = Course.find_or_create_by!(name: '課程 1', lecturer_name: 'Tim Hsueh', description: '課程 1 的描述')
chapter = course.chapters.find_or_create_by!(name: '第一章')
course.chapters.find_or_create_by!(name: '第二章')
chapter.units.find_or_create_by!(name: '單元 1', description: '單元 1 的描述', content: '單元 1 的內容')
chapter.units.find_or_create_by!(name: '單元 2', description: '單元 2 的描述', content: '單元 2 的內容')
chapter.units.find_or_create_by!(name: '單元 3', description: '單元 3 的描述', content: '單元 3 的內容')

course = Course.find_or_create_by!(name: '課程 2', lecturer_name: 'Tim Hsueh', description: '課程 2 的描述')
chapter = course.chapters.find_or_create_by!(name: '第一章')
chapter.units.find_or_create_by!(name: '單元 1', description: '單元 1 的描述', content: '單元 1 的內容')
chapter.units.find_or_create_by!(name: '單元 2', description: '單元 2 的描述', content: '單元 2 的內容')
