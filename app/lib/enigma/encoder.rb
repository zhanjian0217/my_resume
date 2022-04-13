module Enigma
  module Encoder
    def self.encode_password(password)
      Digest::SHA1.hexdigest(salted_string(password)) 
    end

    def self.salted_string(str)
      arr = "zabcdefy".chars
      str = str.chars
      result = arr[0..6].zip(str[0..5]).join
      result + str[6..].join + arr[7..].join 
    end
  end
end