def encode(plaintext, key)
  
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  p cipher
  # array without recurring letters or letters in secret key. 
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char).to_i).chr
  end
  return ciphertext_chars.join
end
  # array without recurring letters or letters in secret key. 
  # iterate through incoming text, adding 65 to index of char
def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[(65 - char.ord) * -1]
  end
   plaintext_chars.join
end


# Intended output:
#
# encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"

decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
puts encode("quickcode", "secretkey")
puts decode(encode("quickcode", "secretkey"), "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
