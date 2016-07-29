module ActionControllerExtensions
  def self.included(base)
    base::Dispatcher.send :include, DispatcherExtensions
  end

  module DispatcherExtensions
    def self.included(base)
      base.send :before_dispatch, :set_session_domain
    end

    def set_session_domain
      domain = @env['HTTP_HOST'].gsub(/:\d+$/, '').gsub(/^[^.]*/, '')
      @env['rack.session.options'].update :domain => domain
    end
  end
end

