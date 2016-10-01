class SecretHandshake

  ACTIONS = [
    'wink',
    'double blink',
    'close your eyes',
    'jump',
  ]

  def initialize(seed)
    if (seed.to_s =~ /[^\d]/).nil?
      seed = seed.to_s(2) unless (seed.to_s =~ /[^01]/).nil?
      @binary = seed.to_s.chars.reverse
    end
  end

  def commands
    binary[4].to_i == 1 ? actions.reverse : actions
  end

  private

  def actions
    ACTIONS.select.with_index do |_action, i|
      binary[i].to_i == 1
    end
  end

  def binary
    @binary ||= []
  end

end
