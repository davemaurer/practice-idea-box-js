class Idea < ActiveRecord::Base
  validates_presence_of :title, :body

  enum quality: %w(swill plausible genius)
end
