class SessionsController < ApplicationController
  before_action :set_session, only: %i[show update destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1

  def show; end

  # POST /sessions

  def create
    @session = Session.new(session_start_params)
    @session.started_at = Time.now
    @session.errors.add(:connector, message: 'connector is not ready!') unless @session.connector.state_ready?
    if @session.errors.empty? && @session.connector.state_busy! && @session.save
      render :show, status: :created, location: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # POST /sessions/1/stop
  def update
    @session.finished_at = Time.now
    if @session.update(session_stop_params) && @session.connector.state_ready!
      render :show, status: :ok, location: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def session_start_params
    params.require(:session).permit(:client_id, :connector_id)
  end

  def session_stop_params
    params.require(:session).permit(:charged)
  end
end
