class DestroyUseCase
  def self.call(entity, attrs, repository, callbacks)
    new(entity, attrs, repository, callbacks).call
  end

  def call
    if @repository.delete(entity)
      @callbacks[:success].call()
    else
      @callbacks[:failure].call(@repository.errors(entity))
    end
  end

  private

  def initialize(entity, attrs, repository, callbacks)
    @entity = entity
    @attrs = attrs
    @callbacks = callbacks
    @repository = repository
  end

  attr_reader :entity, :repository, :callbacks, :attrs
end
