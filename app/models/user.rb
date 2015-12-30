class User < ActiveRecord::Base

  belongs_to :game
  has_many :user_cards
  has_many :cards, through: :user_cards


  before_create :assign_admin

  def assign_admin
    if self.game.users.empty?
      self.admin = true
    end
  end

end