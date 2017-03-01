class ShortStringPacker
  ## BINARY MASKS AND CONSTANTS
  CHARACTER_BITS = 5
  CHARACTER_MASK = 0b1111100000
  AUTHORIZED_CHARACTERS = "abcdefghijklmnopqrstuvwxyz"

  ## Packs a short string into a Fixnum
  # Arguments:
  #   str - String object
  # Returns: a Fixnum object
  def self.pack(str)
    # IMPLEMENT THIS METHOD
    numbers_array = []
    str.split("").each { |s| 
        numbers_array << AUTHORIZED_CHARACTERS.index(s)
    }
    return numbers_array[0].to_s(2) if numbers_array.length == 1
    packed = numbers_array[0]
    length = numbers_array.length - 1
    puts packed.to_s(2)
    for i in 1..length
      packed = (packed << CHARACTER_BITS) | numbers_array[i]
      puts packed.to_s(2) + " " + numbers_array[i].to_s
    end
    return packed.to_i
  end

  ## Unpacks a Fixnum from pack() method into a short string
  # Arguments:
  #   packed - a Fixnum object
  # Returns: a String object
  def self.unpack(packed)
    # IMPLEMENT THIS METHOD
    string = packed.to_s(2)
    unpacked = ""
    while true
      if(string.length >= CHARACTER_BITS)
        char = string[-5, 5]
        string = string[0..-6]
      else
        char = string
        string = ""
      end
      puts char.to_i(2)
      unpacked = AUTHORIZED_CHARACTERS[char.to_i(2)] + unpacked
      break if(string.length == 0)
    end
    puts unpacked
  end
end
