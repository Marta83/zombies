
class EquipUseCase
  def self.call(attrs, repository)
    new(attrs, repository).call
  end

  def call
    entity = @repository.new_entity(attrs)
  end

  private

  def initialize(attrs,repository)
    @attrs = attrs
    @repository = repository
  end

  attr_reader :repository, :attrs
end
