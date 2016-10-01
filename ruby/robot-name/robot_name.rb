class Robot
  @@name_registry = {}

  def name
    @name ||= random_name
  end

  def random_name
    begin
      name = (('A'..'Z').to_a.sample(2) + (0..9).to_a.sample(3)).join('')
    end while (@@name_registry.key? name)
    @@name_registry[name] = 1
    name
  end

  def reset
    @@name_registry.delete(name)
    @name = nil
  end
end

module BookKeeping
  VERSION = 2
end
