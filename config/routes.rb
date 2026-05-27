Rails.application.routes.draw do
  # Routes for the Gifts given resource:

  # CREATE
  post("/insert_gifts_given", { :controller => "gifts_givens", :action => "create" })

  # READ
  get("/gifts_givens", { :controller => "gifts_givens", :action => "index" })

  get("/gifts_givens/:path_id", { :controller => "gifts_givens", :action => "show" })

  # UPDATE

  post("/modify_gifts_given/:path_id", { :controller => "gifts_givens", :action => "update" })

  # DELETE
  get("/delete_gifts_given/:path_id", { :controller => "gifts_givens", :action => "destroy" })

  #------------------------------

  # Routes for the Person resource:

  # CREATE
  post("/insert_person", { :controller => "people", :action => "create" })

  # READ
  get("/people", { :controller => "people", :action => "index" })

  get("/people/:path_id", { :controller => "people", :action => "show" })

  # UPDATE

  post("/modify_person/:path_id", { :controller => "people", :action => "update" })

  # DELETE
  get("/delete_person/:path_id", { :controller => "people", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })
end
