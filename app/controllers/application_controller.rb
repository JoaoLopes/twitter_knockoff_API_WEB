class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  attr_accessor :obj

  before_action :check_auth

  include SessionsHelper
  include ApplicationHelper

  private

    def check_auth

      if !authorized_to_CRUD?
        msg = 'You are not authorized to do that operation'
        flash[:error] = msg

        respond_to do |format|
          format.html { redirect_to request.referer.nil? ? root_url : request.referer }
          format.json { render json: msg, status: :unauthorized }
        end
      end
    end

    def authorized_to_CRUD?
      pushOutput(params)

      crud_op = 
        case params[:action]
        when 'new', 'create'
          'C'
        when 'index', 'show'
          'R'
        when 'edit', 'update'
          'U'
        when 'destroy'
          'D'
        end

      pushOutput('crud_op: ' + crud_op)
      
      has_permission?(obj, get_current_user_role, params[:controller], crud_op)
    end
end
