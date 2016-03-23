class Question < ActiveRecord::Base
  has_secure_token :id_token
  belongs_to :user
  default_scope -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :title, presence: true

  has_many :responses

  def answers
    responses.where(response_id: nil)
  end
  
  def to_param
    id_token
  end
end
