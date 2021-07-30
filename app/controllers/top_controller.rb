class TopController < ApplicationController
  before_action :set_covid_observation, only: :confirmed

  def confirmed
    render json: {
      observation_date: @observation_date || nil,
      countries: jsonified_covid_observations
    }
  end

  private

  def set_covid_observation
    @covid_observations = CovidObservation.where('confirmed >= ?', 1)

    if has_valid_date?
      @covid_observations =
        @covid_observations.where(observation_date: @observation_date)
    end
  end

  def jsonified_covid_observations
    @covid_observations
      .limit(params[:max_results] || 10)
      .as_json(only: [:country, :confirmed, :deaths, :recovered])
  end

  def has_valid_date?
    @observation_date = Date.parse(params[:observation_date]) rescue nil
  end
end
