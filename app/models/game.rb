class Game < ActiveRecord::Base

  has_many :users

  def shuffled_card_array
    Card.all.map { |card| card.id }.shuffle
  end

  def deal_cards_to_players
    players = self.users
    array = shuffled_card_array
    current_index = 0
    UserCard.transaction do
      players.each do |player|
        UserCard.create({ user_id: player.id, card_id: array[current_index] })
        current_index += 2
      end
    end
  end

end