class SolutionSerializer < ActiveModel::Serializer
  attributes :user, :id, :solution, :time_complexity, :space_complexity
end
