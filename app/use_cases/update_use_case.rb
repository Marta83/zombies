
class UpdateUseCase
  def self.call(entity, attrs, repository, callbacks)
    new(entity, attrs, repository, callbacks).call
  end

  def call
    @repository.assign_attributes(entity, attrs)

    if @repository.save(entity)
      @callbacks[:success].call(entity)
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
