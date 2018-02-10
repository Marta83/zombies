 class ArRepository
    def errors(entity)
      entity.errors.full_messages
    end

    def assign_attributes(entity, attrs)
       entity.assign_attributes(attrs)
    end
 end
