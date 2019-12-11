class ClimbsController < ApplicationController
  before_action :current_user_must_be_climb_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_climb_user
    climb = Climb.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == climb.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Climb.ransack(params[:q])
    @climbs = @q.result(:distinct => true).includes(:user, :location).page(params[:page]).per(10)

    render("climb_templates/index.html.erb")
  end

  def show
    @climb = Climb.find(params.fetch("id_to_display"))

    render("climb_templates/show.html.erb")
  end

  def new_form
    @climb = Climb.new

    render("climb_templates/new_form.html.erb")
  end

  def create_row
    @climb = Climb.new

    @climb.user_id = params.fetch("user_id")
    @climb.location_id = params.fetch("location_id")
    @climb.rating = params.fetch("rating")
    @climb.picture = params.fetch("picture") if params.key?("picture")

    if @climb.valid?
      @climb.save

      redirect_back(:fallback_location => "/climbs", :notice => "Climb created successfully.")
    else
      render("climb_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @climb = Climb.new

    @climb.user_id = params.fetch("user_id")
    @climb.location_id = params.fetch("location_id")
    @climb.rating = params.fetch("rating")
    @climb.picture = params.fetch("picture") if params.key?("picture")

    if @climb.valid?
      @climb.save

      redirect_to("/locations/#{@climb.location_id}", notice: "Climb created successfully.")
    else
      render("climb_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @climb = Climb.find(params.fetch("prefill_with_id"))

    render("climb_templates/edit_form.html.erb")
  end

  def update_row
    @climb = Climb.find(params.fetch("id_to_modify"))

    
    @climb.location_id = params.fetch("location_id")
    @climb.rating = params.fetch("rating")
    @climb.picture = params.fetch("picture") if params.key?("picture")

    if @climb.valid?
      @climb.save

      redirect_to("/climbs/#{@climb.id}", :notice => "Climb updated successfully.")
    else
      render("climb_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @climb = Climb.find(params.fetch("id_to_remove"))

    @climb.destroy

    redirect_to("/users/#{@climb.user_id}", notice: "Climb deleted successfully.")
  end

  def destroy_row_from_location
    @climb = Climb.find(params.fetch("id_to_remove"))

    @climb.destroy

    redirect_to("/locations/#{@climb.location_id}", notice: "Climb deleted successfully.")
  end

  def destroy_row
    @climb = Climb.find(params.fetch("id_to_remove"))

    @climb.destroy

    redirect_to("/climbs", :notice => "Climb deleted successfully.")
  end
end
