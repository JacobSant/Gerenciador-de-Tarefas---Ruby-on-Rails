namespace :dev do

    DEFAULT_PASSWORD = 123456
  
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        show_spinner("Apagando BD...") { %x(rails db:drop) }
        show_spinner("Criando BD...") { %x(rails db:create) }
        show_spinner("Migrando BD...") { %x(rails db:migrate) }
        show_spinner("Cadastrando usuário...") { %x(rails dev:add_user) }
        show_spinner("Cadastrando tasks...") { %x(rails dev:add_tasks) }
      else
        puts "Você não está em ambiente de desenvolvimento!"
      end
    end
  
    desc "Adiciona usuario"
    task add_user: :environment do
      User.create!(
        email: 'jacob@gmail.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD,
        name: 'Jacob'
      )
      User.create!(
        email: 'user@gmail.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD,
        name: 'User'
      )
      User.create!(
        email: 'user2@gmail.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD,
        name: 'User2'
      )
    end

  
    desc "adicionar tasks"
    task add_tasks: :environment do
        UserBackoffice::Task.create!(
            title: "Comprar pão",
            description:"Levantar cedo para comprar pão",
            status: "Não concluída",
            priority:"Baixa",
            user: User.first,
            shared:0
        )
        UserBackoffice::Task.create!(
            title: "Entregar projeto",
            description:"Terminar e entregar o projeto",
            status: "Não concluída",
            priority:"Alta",
            user: User.first,
            shared:0
        )
        UserBackoffice::Task.create!(
            title: "Entregar projeto 2",
            description:"Terminar e entregar o projeto",
            status: "Não concluída",
            priority:"Baixa",
            user: User.first,
            shared:0
        )
        UserBackoffice::Task.create!(
            title: "Entregar projeto 3, task compartilhada",
            description:"Terminar e entregar o projeto",
            status: "Não concluída",
            priority:"Alta",
            user: User.first,
            shared:1
        )
        UserBackoffice::ListShared.create(
          user_backoffice_task_id: 4,
          user_id: 2
        )
        UserBackoffice::ListShared.create(
          user_backoffice_task_id: 4,
          user_id: 3
        )
    end
  
    private
  
  
    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")    
    end
  
  end