class CoordinatorsController < ApplicationController

  respond_to :json

  def index
    @coordinators = Coordinator.sorted
  end

  def show
    @coordinator = Coordinator.find(params[:id])
  end

  def new
    @coordinator = Coordinator.new
    @contact_info = ContactInfo.new
    @phone = Phone.new
  end

  def create
    # binding.pry
    @contact_info = ContactInfo.new(:email => params[:email])
    @phone = Phone.new(:phone_type => 'work', :phone_number => params[:work_phone])
    @coordinator = Coordinator.new(params[:coordinator])
    @coordinator.contact_info = @contact_info
    @coordinator.phones << @phone
    if @coordinator.valid? && @contact_info.valid? && @phone.valid?
      @coordinator.save
      # binding.pry
      render :show
    end
  end

  def edit
    @coordinator = Coordinator.find params[:id]
    @contact_info = @coordinator.contact_info
    @phone = @coordinator.phones.first || Phone.new
  end

  def update
    # binding.pry
    @coordinator = Coordinator.find params[:id]
    @coordinator.first_name = params[:first_name]
    @coordinator.last_name = params[:last_name]
    @coordinator.contact_info.email = params[:email]
    phone = @coordinator.phones.first
    if phone.present?
      phone.phone_number = params[:work_phone]
    else
      phone = Phone.new(:phone_type => 'work', :phone_number => params[:work_phone])
      @coordinator.phones << phone
    end

    if @coordinator.valid? && @coordinator.contact_info.valid? && phone.valid?
      @coordinator.contact_info.save
      phone.save
      @coordinator.save
      render :show
    else
      binding.pry
      # log.error("Coordinator was not valid!!!: #{@coordinator.errors.inspect}")
    end
  end

  def destroy
    coordinator = Coordinator.find params[:id]
    coordinator.destroy
    render :nothing => true, :status => :ok
  end

end
