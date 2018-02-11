module ModelSpecHelper
  def update(entity, attribute, value)
    entity.write_attribute(attribute, value)
    entity.save
    #wait for index to update
    sleep(3)
    return entity
  end
end
