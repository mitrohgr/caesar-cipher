def downcase?(char)
  char.ord >= 97 && char.ord <= 122
end

def upcase?(char)
  char.ord >= 65 && char.ord <= 90
end

def caesar_cipher(string, shift_factor)
  cipher_text = ""
  
  # [Source: https://en.wikipedia.org/wiki/Caesar_cipher]
  # Encryption of a letter x by a shift n can be described mathematically
  # as: (x + n) mod 26, where x is in range 0 to 25 (where a/A -> 0, b/B
  # -> 1,..., z/Z -> 25).
  string.each_char do |char|
    if downcase?(char)
      new_char = (((char.ord - "a".ord + shift_factor) % 26) + "a".ord).chr
      cipher_text.concat(new_char)
    elsif upcase?(char)
      new_char = (((char.ord - "A".ord + shift_factor) % 26) + "A".ord).chr
      cipher_text.concat(new_char)
    else
      cipher_text.concat(char)
    end
  end

  cipher_text
end

caesar_cipher("What a string!", 5)
