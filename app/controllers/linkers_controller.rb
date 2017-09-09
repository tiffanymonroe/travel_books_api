class LinkersController < ApplicationController
  before_action :set_linker, only: [:show, :update, :destroy]

  # GET /linkers
  def index
    @linkers = Linker.all

    render json: @linkers
  end

  # GET /linkers/1
  def show
    render json: @linker
  end

  # POST /linkers
  def create
    @linker = Linker.new(linker_params)

    if @linker.save
      render json: @linker, status: :created, location: @linker
    else
      render json: @linker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /linkers/1
  def update
    if @linker.update(linker_params)
      render json: @linker
    else
      render json: @linker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /linkers/1
  def destroy
    @linker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linker
      @linker = Linker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def linker_params
      params.require(:linker).permit(:book_id, :destination_id)
    end
end
