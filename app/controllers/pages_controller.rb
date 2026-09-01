class PagesController < ApplicationController
    def home
    end

    def services
        @services = [
            { name: "Tire change", price: "$15000" },
            { name: "Flat tire repair", price: "$10000" },
            { name: "Brake adjustment", price: "$20000" },
            { name: "Brake pad replacement", price: "$25000" },
            { name: "Chain lubrication", price: "$15000" },
            { name: "Chain replaecment", price: "$20000" },
            { name: "Basic maintenance", price: "$30000" },
            { name: "Complete maintenance", price: "$50000" }
        ]
    end

    def visit
    end

    def about
    end
end
