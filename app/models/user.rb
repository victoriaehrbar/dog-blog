class User < ApplicationRecord
    has_many :updates
    has_many :dogs, through: :updates

    validates :email, uniqueness: true, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
    validates :username, presence: true


    has_secure_password #gives access to authenticate, validatations of password

end
