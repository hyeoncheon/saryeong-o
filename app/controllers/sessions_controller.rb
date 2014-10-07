class SessionsController < ApplicationController
  def create
    render :xml => request.env['omniauth.auth'].to_xml
  end
end
# vim: set ts=2 sw=2 expandtab:
