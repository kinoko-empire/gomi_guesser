Rails.application.routes.draw do
  resources :prefectures
  resources :municipalities
  resources :items
  resource :session, only: [ :new ]
  resources :passwords, param: :token, only: [ :new ]
  inertia "/" => "Landing"

  namespace "admin" do
    resources :items
    resources :prefectures do
      # https://guides.rubyonrails.org/routing.html#shallow-nesting
      # per rails routing guide linked above, indicating "shallow: true"
      # is like having municipality [:index, :new, :create] routes nested under prefectures
      # e.g. /admin/prefectures/13/municipalities/ for the :index route
      # and having municipality [:show, :edit, :update, :destroy] routes unnested
      # e.g. /admin/municipalities/1 for the :show route
      resources :municipalities, shallow: true
    end

    get "/", to: redirect("/admin/dashboard")
    get "dashboard", to: "dashboard#index"
  end

  namespace "gomi_guesser" do
    inertia "/" => "Landing"
    inertia "/test" => "Landing"
  end

  get "inertia-example", to: "inertia_example#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
