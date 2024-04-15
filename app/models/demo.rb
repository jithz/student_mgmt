class Demo < ApplicationRecord
  has_one :sub_demo

  before_create :greeting_message

  def greeting_message
    puts 'hey! i will run before save'
  end

  before_create do
    puts 'second callback'
  end
end