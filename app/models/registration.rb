class Registration < ActiveRecord::Base
  belongs_to :show
  belongs_to :exhibitor
  has_many :rooms
  has_one :show
  has_one :exhibitor

  attr_accessible :exhibitor_id, :show_id
end
