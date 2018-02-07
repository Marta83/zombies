
class ZombieCreateUseCase
  def self.call(attrs, callback, repository)
    new(attrs, callback, repository).call
  end

  def call
    zombie = @repository.new_entity(attrs)

    @repository.save(zombie)
    @callback.call(zombie)
  end

  private

  def initialize(attrs, callback, repository)
    @attrs = attrs
    @callback = callback
    @repository = repository
  end

  attr_reader :repository, :callbacks, :attrs
end
