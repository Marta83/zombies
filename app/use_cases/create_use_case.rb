
class CreateUseCase
  def self.call(attrs, repository, callbacks)
    new(attrs, repository, callbacks).call
  end

  def call
    entity = @repository.new_entity(attrs)

    if @repository.save(entity)
      @callbacks[:success].call(entity)
    else
      @callbacks[:failure].call(@repository.errors(entity))
    end
  end

  private

  def initialize(attrs, repository, callbacks)
    @attrs = attrs
    @callbacks = callbacks
    @repository = repository
  end

  attr_reader :repository, :callbacks, :attrs
end
