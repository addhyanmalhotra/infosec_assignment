class ApplicationController < ActionController::Base
    layout :layout

    private

    def layout
        # only turn it off for login pages:
        devise_controller? ? 'session' : nil
    end
end
