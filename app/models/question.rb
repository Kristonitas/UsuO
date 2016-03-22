class Question < ActiveRecord::Base
  has_secure_token :id_token
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true

  has_many :answers, class_name: "Response"
  
  def to_param
    id_token
  end
end
