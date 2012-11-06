class Location < ActiveRecord::Base
  attr_accessible :category, :description, :image_url, :name
  has_many :waits, dependent: :destroy
  validates :category, :description, :image_url, :name, presence: true
  validates :name, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:
    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }


def self.search(search)
  if search
    where('name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
  else
    scoped
  end
end


end
