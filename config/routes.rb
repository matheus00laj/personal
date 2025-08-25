Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :posts
  # requisição get para a pagina onde estarão as postagens
  # get "/posts", to: "posts#index"

  # requisição get para abrir uma postagem,
  # utilizando o ID da postagem como parâmetro.
  # get "/posts/:id", to: "posts#show"

  # requisição get para abrir a pagina de criação de novas postagens
  # get "/post/new", to: "posts#new"

  # requisição post para a criação de novas postagens
  # post "/posts", to: "posts#create"

  # requisição get para abrir o formulário de edição de postagens
  # get "/posts/:id/edit", to: "posts#edit"

  # requisição put para atualizar completamente a postagem
  # put "/posts/:id", to: "posts#update"

  # requisição patch para editar apenas os campos especificados da postagem
  # patch "/posts/:id", to: "posts#update"

  # requisição para deletar a postagem
  # delete "/posts/:id", to: "posts#destroy"





  # o campo ":id" é o parametro utilizado para achar a postagem que será
  # deletada. Basicamente, irá procurar pelo titulo da postagem, que irá
  # ser encontrada no banco de dados e terá suas informações enviadas para a
  # aplicação.








  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
