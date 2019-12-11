Rails.application.routes.draw do
  # Routes for the Climb resource:

  # CREATE
  get("/climbs/new", { :controller => "climbs", :action => "new_form" })
  post("/create_climb", { :controller => "climbs", :action => "create_row" })

  # READ
  get("/climbs", { :controller => "climbs", :action => "index" })
  get("/climbs/:id_to_display", { :controller => "climbs", :action => "show" })

  # UPDATE
  get("/climbs/:prefill_with_id/edit", { :controller => "climbs", :action => "edit_form" })
  post("/update_climb/:id_to_modify", { :controller => "climbs", :action => "update_row" })

  # DELETE
  get("/delete_climb/:id_to_remove", { :controller => "climbs", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
