Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post 'screenings/scrape_bryn_mawr'
post 'screenings/scrape_roxy'
post 'screenings/scrape_ambler'
post 'screenings/scrape_ihouse'
post 'screenings/scrape_colonial'


resources :screenings

end