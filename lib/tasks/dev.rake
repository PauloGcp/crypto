namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if(Rails.env == 'development')
      show_spinner("Apagando DB") do 
        %x(rails db:drop) 
      end
      show_spinner("Criando DB") do 
        %x(rails db:create)
      end
      show_spinner("Migrando DB") {
        %x(rails db:migrate)
      }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_type)
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do   
    show_spinner("Cadastrando moedas") do 
      coins = [{
        description: 'Teste1', acronym: 'Tst1', url: ''
      }, {
        description: 'Teste2', acronym: 'Tst2', url: ''
      }, {
        description: 'Teste3', acronym: 'Tst3', url: ''
      }]
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end  
  end

  desc "Cadastro de tipos de mineração"
  task add_mining_type: :environment do
    show_spinner("Cadastrando os tipos de mineração") do 
      mining_types = [{
        description: "Proof of Work",
        acronym: "PoW"
      }, 
      {
        description: "Proof of Stake",
        acronym: "PoS"
      },
      {
        description: "Proof of Capacity",
        acronym: "PoC"
      }]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end 
  end
  def show_spinner(msg_initial)
    spinner = TTY::Spinner.new("[:spinner] #{msg_initial}")
    spinner.auto_spin
    yield
    spinner.success("Concluído!")
  end
end
