class Coordinator < ActiveRecord::Base
  has_many :shows
  belongs_to :contact_info
  has_many :phones, :as => :phoneable

  attr_accessible :email, :first, :last, :phone

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :email
  validates_presence_of :phone

end
