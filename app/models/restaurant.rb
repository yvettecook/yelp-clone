class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 3}, uniqueness: true


  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end

end
