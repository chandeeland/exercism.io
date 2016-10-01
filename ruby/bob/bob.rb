class Bob
  def hey(phrase)
    phrase = phrase.gsub(/[^A-Za-z0-9?]/,'')
    if phrase == phrase.upcase && phrase.gsub(/[^A-Z]/,'').length > 0
      return 'Whoa, chill out!'
    end
    return 'Sure.' if phrase[-1] == '?'
    return 'Fine. Be that way!' if phrase.empty?
    'Whatever.'
  end
end
