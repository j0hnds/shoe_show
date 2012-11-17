# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear out the database
Attendance.delete_all
Associate.delete_all
Line.delete_all
Room.delete_all
Phone.delete_all
Registration.delete_all
Show.delete_all
Exhibitor.delete_all
Buyer.delete_all
Store.delete_all
Coordinator.delete_all
Venue.delete_all
ContactInfo.delete_all

# Create the coordinator contact info
coord_contact = ContactInfo.create :email => "coord@email.com"
venue_contact = ContactInfo.create(:address_1 => "123 Main St",
                                   :city => "Nome",
                                   :state => "AK",
                                   :postal_code => "10010")

# Create a coordinator
coord1 = Coordinator.new(:first_name => "Jenny",
                         :last_name => "Craig")
coord1.contact_info = coord_contact
coord1.save!

# Create phones for coordinator
coord1.phones << Phone.new(:phone_type => "work", :phone_number => "800-101-1111")

# Create a venue
venue1 = Venue.new :name => "Hotel 23"
venue1.contact_info = venue_contact
venue1.save!

# Create phones for venue
venue1.phones << Phone.new(:phone_type => "rsrv", :phone_number => "800-101-2222")
venue1.phones << Phone.new(:phone_type => "main", :phone_number => "800-101-3333")

# Now we can create a couple of shows.
show1 = Show.new(:name => "March 2012",
                 :start_date => "2012-03-01",
                 :end_date => "2012-03-03",
                 :next_start_date => "2012-09-01",
                 :next_end_date => "2012->09-03")
show1.coordinator = coord1
show1.venue = venue1
show1.save!

show2 = Show.new(:name => "September 2012",
                 :start_date => "2012-09-01",
                 :end_date => "2012-09-03",
                 :next_start_date => "2013-03-01",
                 :next_end_date => "2013->03-03")
show2.coordinator = coord1
show2.venue = venue1
show2.save!

# Create some exhibitors
ex_ci = ContactInfo.create(:address_1 => "123 Main St",
                           :city => "Nome",
                           :state => "AK",
                           :postal_code => "10010",
                           :email => "sam.neil@email.com")
ex_1 = Exhibitor.new(:first_name => "Sam",
                     :last_name => "Neil")
ex_1.contact_info = ex_ci
ex_1.save!
ex_1.phones << Phone.new(:phone_type => "work", :phone_number => "800-101-0001")
ex_1.phones << Phone.new(:phone_type => "cell", :phone_number => "800-101-0002")
ex_1.phones << Phone.new(:phone_type => "fax", :phone_number => "800-101-0003")

ex_ci = ContactInfo.create(:address_1 => "234 Main St",
                           :city => "Nome",
                           :state => "AK",
                           :postal_code => "10010",
                           :email => "jerry.mcguire@email.com")
ex_2 = Exhibitor.new(:first_name => "Jerry",
                     :last_name => "McGuire")
ex_2.contact_info = ex_ci
ex_2.save!
ex_2.phones << Phone.new(:phone_type => "work", :phone_number => "800-101-0004")
ex_2.phones << Phone.new(:phone_type => "cell", :phone_number => "800-101-0005")
ex_2.phones << Phone.new(:phone_type => "fax", :phone_number => "800-101-0006")

ex_ci = ContactInfo.create(:address_1 => "345 Main St",
                           :city => "Nome",
                           :state => "AK",
                           :postal_code => "10010",
                           :email => "sara.parker@email.com")
ex_3 = Exhibitor.new(:first_name => "Sara",
                     :last_name => "Parker")
ex_3.contact_info = ex_ci
ex_3.save!
ex_3.phones << Phone.new(:phone_type => "work", :phone_number => "800-101-0007")
ex_3.phones << Phone.new(:phone_type => "cell", :phone_number => "800-101-0008")
ex_3.phones << Phone.new(:phone_type => "fax", :phone_number => "800-101-0009")

# Create some stores

store_ci = ContactInfo.create(:address_1 => "885 Main St",
                              :city => "Nome",
                              :state => "AK",
                              :postal_code => "10010")
store_1 = Store.new(:name => "Shoes R Us")
store_1.contact_info = store_ci
store_1.save!
store_1.phones << Phone.new(:phone_type => "main", :phone_number => "800-101-0000")

b_ci = ContactInfo.create(:email => "sheila.e@email.com")

buyer1 = Buyer.new(:first_name => "Sheila",
                   :last_name => "E")
buyer1.contact_info = b_ci
buyer1.store = store_1
buyer1.phones << Phone.new(:phone_type => "cell", :phone_number => "800-101-1000")

store_ci = ContactInfo.create(:address_1 => "985 Main St",
                              :city => "Nome",
                              :state => "AK",
                              :postal_code => "10010")
store_2 = Store.new(:name => "Clogs R Us")
store_2.contact_info = store_ci
store_2.save!
store_2.phones << Phone.new(:phone_type => "main", :phone_number => "800-101-0010")

b_ci = ContactInfo.create(:email => "gary.sperry@email.com")

buyer2 = Buyer.new(:first_name => "Gary",
                   :last_name => "Sperry")
buyer2.contact_info = b_ci
buyer2.store = store_2
buyer2.phones << Phone.new(:phone_type => "cell", :phone_number => "800-101-1001")

store_ci = ContactInfo.create(:address_1 => "995 Main St",
                              :city => "Nome",
                              :state => "AK",
                              :postal_code => "10010")
store_3 = Store.new(:name => "Sandals R Us")
store_3.contact_info = store_ci
store_3.save!
store_3.phones << Phone.new(:phone_type => "main", :phone_number => "800-101-0020")

b_ci = ContactInfo.create(:email => "mary.magdalaine@email.com")

buyer3 = Buyer.new(:first_name => "Mary",
                   :last_name => "Magdalaine")
buyer3.contact_info = b_ci
buyer3.store = store_3
buyer3.phones << Phone.new(:phone_type => "cell", :phone_number => "800-101-1002")

# Set up some registrations

r1 = Registration.new
r1.show = show1
r1.exhibitor = ex_1
r1.save!

r1.rooms << Room.new(:room => '101')
room = r1.rooms.first
room.lines << Line.new(:order => 1, :line => "Big Foot")
room.lines << Line.new(:order => 2, :line => "Small Foot")

room.associates << Associate.new(:first_name => "Steve", :last_name => "Carell")

r2 = Registration.new
r2.show = show1
r2.exhibitor = ex_3
r2.save!

r2.rooms << Room.new(:room => '102')
room = r2.rooms.first
room.lines << Line.new(:order => 1, :line => "Cloggers")
room.lines << Line.new(:order => 2, :line => "Smellers")

r3 = Registration.new
r3.show = show2
r3.exhibitor = ex_2
r3.save!

r3.rooms << Room.new(:room => '101')
room = r3.rooms.first
room.lines << Line.new(:order => 1, :line => "Clamdiggers")
room.lines << Line.new(:order => 2, :line => "Shrimpdiggers")

room.associates << Associate.new(:first_name => "Tory", :last_name => "Spelling")

r4 = Registration.new
r4.show = show2
r4.exhibitor = ex_3
r4.save!

r4.rooms << Room.new(:room => '103')
room = r4.rooms.first
room.lines << Line.new(:order => 1, :line => "Spelunk")
room.lines << Line.new(:order => 2, :line => "Kerplunk")

# Do the buyer attendances

att_1 = Attendance.new
att_1.show = show1
att_1.buyer = buyer1
att_1.save!

att_2 = Attendance.new
att_2.show = show1
att_2.buyer = buyer2
att_2.save!

att_3 = Attendance.new
att_3.show = show1
att_3.buyer = buyer3
att_3.save!
