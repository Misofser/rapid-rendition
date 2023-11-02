module ApplicationHelper
    def current_page(path)
        "active" if current_page?(path)
    end

    def show_demo_banner?
        unless cookies[:demo_banner_seen]
            return true
        end
        
        false
    end

end
