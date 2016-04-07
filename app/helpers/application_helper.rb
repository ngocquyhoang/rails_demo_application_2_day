module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Demo App"
    if page_title.empty?
      base_title
    else
      page_title + " - " + base_title
    end
  end

  def set_notice_type(flash)
    color = ""
  	flash.each do |type, message|
  		case type 
			when "success"
			  color = "green"
			when "notice"
			  color = "blue"
      when "error"
        color = "red"
			else
			  color = "amber"
			end
    end
    return color
  end

  def set_message(flash)
    message = []
    t_message = []
    flash.each do |type, f_message|
      if f_message.kind_of?(String)
        t_message[0] = f_message
      else
        t_message = f_message.full_messages if f_message.class.method_defined? :full_messages
        # byebug
      end
      t_message.each do |mess|
        message.push(mess)
      end
    end
    return message
  end

  def valid_new_user_class(field)
    if flash[:error].present?
      if flash[:error].messages[field].present?
        return "validate invalid"
      else
        return "validate"
      end
    else
      return "validate"
    end
  end

  def has_flash()
    if flash.present?
      return true
    else
      return false
    end
  end

end
