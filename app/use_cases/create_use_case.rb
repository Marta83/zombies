
class CreateUseCase
  def self.call(attrs, callback, repository)
    new(attrs, callback, repository).call
  end

  def call
    entity = @repository.new_entity(attrs)

    @repository.save(entity)
    @callback.call(entity)
  end

  private

  def initialize(attrs, callback, repository)
    @attrs = attrs
    @callback = callback
    @repository = repository
  end

  attr_reader :repository, :callbacks, :attrs
end
