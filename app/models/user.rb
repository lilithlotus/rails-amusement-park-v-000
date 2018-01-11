class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  validates :name, :password, presence: true
  has_many :rides
  has_many :attractions, through: :rides

  def mood

    if self.happiness > self.nausea
      return "happy"
    else
      return "sad"
    end
  end

end
