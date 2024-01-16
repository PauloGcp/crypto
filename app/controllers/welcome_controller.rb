class WelcomeController < ApplicationController
  def index
    puts "Bucetaaa #{params}"
    @nome = params[:nome]
  end
end
