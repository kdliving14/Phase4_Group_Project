class AlgorithmSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :solutions, serializer: SolutionSerializer
end
