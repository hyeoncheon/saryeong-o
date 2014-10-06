class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  before_action :set_cenv

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  def rping
    # FIXME need to check server by uuid. (to check hostname changed)
    #
    unless @server = Server.find_by(hostname: server_params['hostname'])
      LOGGER.warn "server not found. create new server..."
      @server = Server.new(server_params)
      @server.uuid = SecureRandom.uuid
      @ip_addr = @server.ip_addrs.new(addr: @cenv['remote_ip'])
    else
      unless @ip_addr = @server.ip_addrs.find_by(addr: @cenv['remote_ip'])
        LOGGER.warn "rping from unknown address. change default."
        # XXX which is better? ignore or reject?

        # if there is another addresses for server, remove default flag.
        @server.ip_addrs.each do |addr|
          addr.update_attribute(:default, false)
          LOGGER.info "> now '#{addr.addr}' is sub address."
        end
        @ip_addr = @server.ip_addrs.new(addr: @cenv['remote_ip'])
      end
    end
    LOGGER.debug "selected server: #{@server.inspect}"
    LOGGER.debug "selected address: #{@ip_addr.inspect}"

    if @ip_addr.id == nil
      LOGGER.warn "register new address. check duplication!"
      IpAddr.where(addr: @cenv['remote_ip']).limit(20).each do |addr|
        # more condition checks are required.
        LOGGER.warn "> now '#{addr.addr}' is marked as 'dup'."
        addr.update_attribute(:dup, true)
      end
    end

    respond_to do |format|
      if @server.save
        format.json { render :show, status: :created, location: @server }
        format.sh { render :show, status: :created, location: @server }
      end
    end
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    def set_cenv
      @cenv = Hash.new
      @cenv['remote_ip'] = request.remote_ip
      LOGGER.debug @cenv
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:hostname, :os, :arch, :version, :uuid)
    end
end
# vim: set ts=2 sw=2 expandtab:
