class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum:6 }
 
  
  def self.login(user_data)
    account = user_data[:account]
    password = user_data[:password]

    if account && password
      user = User.find_by("email = ? OR username = ?", account, account)

      if user && user.password == Enigma::Encoder.encode_password(password)
        user
      else
        nil
      end

    else
      nil
    end

  end





  before_save :encrypt_password

  private
    def encrypt_password
      self.password = Enigma::Encoder.encode_password(self.password)
    end
end
