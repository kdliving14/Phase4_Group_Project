class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :solution, :time_complexity, :space_complexity
  belongs_to :user
end
