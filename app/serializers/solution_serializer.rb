class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :solution, :time_complexity, :space_complexity, :algorithm_id
  belongs_to :user
end
