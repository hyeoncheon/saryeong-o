class IpAddrsController < ApplicationController
  before_action :set_ip_addr, only: [:show, :edit, :update, :destroy]

  # GET /ip_addrs
  # GET /ip_addrs.json
  def index
    @ip_addrs = IpAddr.all
  end

  # GET /ip_addrs/1
  # GET /ip_addrs/1.json
  def show
  end

  # GET /ip_addrs/new
  def new
    @ip_addr = IpAddr.new
  end

  # GET /ip_addrs/1/edit
  def edit
  end

  # POST /ip_addrs
  # POST /ip_addrs.json
  def create
    @ip_addr = IpAddr.new(ip_addr_params)

    respond_to do |format|
      if @ip_addr.save
        format.html { redirect_to @ip_addr, notice: 'Ip addr was successfully created.' }
        format.json { render :show, status: :created, location: @ip_addr }
      else
        format.html { render :new }
        format.json { render json: @ip_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ip_addrs/1
  # PATCH/PUT /ip_addrs/1.json
  def update
    respond_to do |format|
      if @ip_addr.update(ip_addr_params)
        format.html { redirect_to @ip_addr, notice: 'Ip addr was successfully updated.' }
        format.json { render :show, status: :ok, location: @ip_addr }
      else
        format.html { render :edit }
        format.json { render json: @ip_addr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_addrs/1
  # DELETE /ip_addrs/1.json
  def destroy
    @ip_addr.destroy
    respond_to do |format|
      format.html { redirect_to ip_addrs_url, notice: 'Ip addr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_addr
      @ip_addr = IpAddr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_addr_params
      params.require(:ip_addr).permit(:addr, :default, :server_id)
    end
end
