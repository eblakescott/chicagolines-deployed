class Location < ActiveRecord::Base
  attr_accessible :category, :description, :image_url, :name, :address, :map_image_url
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
    where('name ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  else
    scoped
  end
end


end
