module NotificationsHelper

  def unread(notification)
    if notification.read
      return 'read'
    else
      return 'unread'
    end
  end

end
