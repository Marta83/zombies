class SearchUseCase
  def self.call(attrs, repository, callbacks)
    new(attrs, repository, callbacks).call
  end

  def call
    entities = @repository.filter(attrs)
    @callbacks[:success].call(entities)
  end

  private

  def initialize(attrs, repository, callbacks)
    @attrs = attrs
    @callbacks = callbacks
    @repository = repository
  end

  attr_reader :repository, :callbacks, :attrs
end
