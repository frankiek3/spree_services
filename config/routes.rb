routes = lambda do
  namespace :admin do
    resources :products do 
       resources :variants do
        get :service, on: :member
      end
    end

    resources :service_types do
      get :service_fields, on: :member
      get :volume_prices, on: :member
      collection do
        post :update_volume_price_positions
      end
    end

    resources :orders do
      get :notify_customer, on: :member
    end

    delete '/service_fields/:id', to: "service_fields#destroy", as: :service_field
    delete '/volume_prices/:id', to: "volume_prices#destroy", as: :volume_price
  end
end

if Spree::Core::Engine.respond_to?(:add_routes)
  Spree::Core::Engine.add_routes(&routes)
else
  Spree::Core::Engine.routes.draw(&routes)
end
