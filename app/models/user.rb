class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  has_many :questions, dependent: :destroy
  has_secure_token :id_token

  def to_param
    id_token
  end
end
