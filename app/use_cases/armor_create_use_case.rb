
class ArmorCreateUseCase
  def self.call(attrs, callback, repository)
    new(attrs, callback, repository).call
  end

  def call
    armor = @repository.new_entity(attrs)

    @repository.save(armor)
    @callback.call(armor)
  end

  private

  def initialize(attrs, callback, repository)
    @attrs = attrs
    @callback = callback
    @repository = repository
  end

  attr_reader :repository, :callbacks, :attrs
end
