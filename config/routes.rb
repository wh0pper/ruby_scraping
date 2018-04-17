Rails.application.routes.draw do
  root 'content#scrape'

  resources :courses do
    resources :weeks
  end

  resources :weeks do
    resources :lessons
  end
end
