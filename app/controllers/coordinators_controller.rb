class CoordinatorsController < ApplicationController

  def index
    @coordinators = Coordinator.sorted
  end

  def new
    @coordinator = Coordinator.new
    @contact_info = ContactInfo.new
    @phone = Phone.new
  end

  def create
    @contact_info = ContactInfo.new(params[:contact_info])
    @phone = Phone.new(params[:phone])
    @coordinator = Coordinator.new(params[:coordinator])
    @coordinator.contact_info = @contact_info
    @coordinator.phones << @phone
    if @coordinator.valid? && @contact_info.valid? && @phone.valid?
      @coordinator.save
    end

    redirect_to coordinators_path
  end

  def edit
    @coordinator = Coordinator.find params[:id]
    @contact_info = @coordinator.contact_info
    @phone = @coordinator.phones.first || Phone.new
  end

  def update
    @coordinator = Coordinator.find params[:id]
    @coordinator.first_name = params[:coordinator][:first_name]
    @coordinator.last_name = params[:coordinator][:last_name]
    @coordinator.contact_info.email = params[:contact_info][:email]
    phone = @coordinator.phones.first
    if phone.present?
      phone.phone_number = params[:phone][:phone_number]
    else
      phone = Phone.new(params[:phone][:phone_number])
      @coordinator.phones << phone
    end

    if @coordinator.valid? && @coordinator.contact_info.valid? && phone.valid?
      @coordinator.contact_info.save
      phone.save
      @coordinator.save
    else
      log.error("Coordinator was not valid!!!: #{@coordinator.errors.inspect}")
    end

    redirect_to coordinators_path
  end

end
