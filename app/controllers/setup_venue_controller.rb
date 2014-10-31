class SetupVenueController < ApplicationController
  include Wicked::Wizard
  steps :venue_setup

  def show
    @user = current_user
    case step
    when :venue_setup
      @venue = Venue.new
    end
    render_wizard
  end

  def update
    @user = current_user
    @venue = Venue.new(venue_params)
    @venue.users << @user

    render_wizard @venue
  end

  private

  def redirect_to_finish_wizard
    redirect_to dashboard_path, notice: "Thank you for signing up. You can now build your Venue"
  end

  def venue_params
    params.require(:venue).permit(:name, :description, :plan_id, {:user_ids => []})
  end

end
