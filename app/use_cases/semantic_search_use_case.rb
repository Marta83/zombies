
class SemanticSearchUseCase
  def self.call(query, repository, callbacks)
    new(query, repository, callbacks).call
  end

  def call
    entities = @repository.search(query)

    @callbacks[:success].call(entities)
  end

  private

  def initialize(query, repository, callbacks)
    @query = query
    @callbacks = callbacks
    @repository = repository
  end

  attr_reader :repository, :callbacks, :query
end
