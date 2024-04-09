module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def ambiente_rails
        if Rails.env == 'development'
            return "Desenvolvimento"
        elsif Rails.env == 'production'
            return "Producão"
        else return "Teste"
        end
    end

    def locale(loc)
        loc === :en ?  "Inglês" :  "Português - BR"
    end
end
