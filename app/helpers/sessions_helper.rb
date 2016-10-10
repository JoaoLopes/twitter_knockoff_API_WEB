module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def get_current_user_role
    if  logged_in?
      current_user.role
    else
      Role.guest 
    end
  end

  def has_permission?(obj, role, controller, crud_op)

    perms = CrudOperation.where('controller = ? and role_id = ? and (crud_op = \'*\' or crud_op = ?)', controller, role, crud_op)
    if perms.empty?
      perms = CrudOperation.where('controller = ? and role_id = ? and (crud_op = \'*\' or crud_op = ?)', CrudOperation.default_controller, role, crud_op)
    end

    if perms.count > 1
      raise 'Records duplicated on CrudOperation, not good... Please contact administrator about this error.'
    elsif perms.count == 0
      raise 'Something went wrong on permissions. Please contact administrator about this error.'
    else
      perm = perms[0]
    end
    puts params
    puts obj
    puts perm.eval_exp

    return eval(perm.eval_exp)

  end

end