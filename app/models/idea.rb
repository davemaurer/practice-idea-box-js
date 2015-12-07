class Idea < ActiveRecord::Base
  validates_presence_of :title, :body
  validates :quality, inclusion: { in: %w(swill plausible genius) }
end
