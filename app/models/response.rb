class Response < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  
  belongs_to :response
  belongs_to :question
  belongs_to :user

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true
  
  has_secure_token :id_token
  has_many :comments, class_name: "Response"
end
