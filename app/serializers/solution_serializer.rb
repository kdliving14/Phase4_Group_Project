class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :solution, :time_complexity, :space_complexity
  has_one :user
  has_one :algorithm
end
