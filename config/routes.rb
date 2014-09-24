BiscuitRecruitment::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"
  resources :vacancies, only: [:index, :show]
  # resources :testimonials, only: [:index]
  resources :vacancy_applications, only: [:new, :create]
  resources :newsletter_subscribers, only: [:create]
  get 'contact-us', to: 'enquiries#new', as: :enquiries
  post 'contact-us', to: 'enquiries#create'
  get '/blog', to: 'blog_posts#index'
  get '/blog/*id', to: 'blog_posts#show', as: :blog_post
  get '*id', to: 'pages#show', as: :page
end