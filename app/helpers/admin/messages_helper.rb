module Admin::MessagesHelper
  def message_weight(message)
    !message.status ? 'font-weight:bold' : 'font-weight:normal'
  end

  def build_read_status_link(message)
    if message.status
      link_to 'Read', admin_message_path(message, status: false), method: :put
    else
      link_to 'Un-read', admin_message_path(message, status: true), method: :put
    end
  end
end
