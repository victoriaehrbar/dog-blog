class User < ApplicationRecord
    has_many :updates
    has_many :dogs, through: :updates

    validates :email, uniqueness: true, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
    validates :username, presence: true


    has_secure_password #gives access to authenticate, validatations of password

    def self.from_omniauth(auth)
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
        u.username = auth['info']['first_name']
        # byebug
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(10)
        end
    end

end
