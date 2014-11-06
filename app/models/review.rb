class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user
  has_many :endorsements

  validates :rating, inclusion: (1..5)
  validates_uniqueness_of :user_id, scope: :restaurant_id, :message => 'Sorry, you can only review a restaurant once', allow_nil: true

end
