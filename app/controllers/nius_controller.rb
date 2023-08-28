class NiusController < ApplicationController
  before_action :set_niu, only: %i[ show edit update destroy ]

  # GET /nius or /nius.json
  def index
    @nius = Niu.all
  end

  # GET /nius/1 or /nius/1.json
  def show
  end

  # GET /nius/new
  def new
    @niu = Niu.new
  end

  # GET /nius/1/edit
  def edit
  end

  # POST /nius or /nius.json
  def create
    @niu = Niu.new(niu_params)

    respond_to do |format|
      if @niu.save
        format.html { redirect_to niu_url(@niu), notice: "Niu was successfully created." }
        format.json { render :show, status: :created, location: @niu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @niu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nius/1 or /nius/1.json
  def update
    respond_to do |format|
      if @niu.update(niu_params)
        format.html { redirect_to niu_url(@niu), notice: "Niu was successfully updated." }
        format.json { render :show, status: :ok, location: @niu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @niu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nius/1 or /nius/1.json
  def destroy
    @niu.destroy

    respond_to do |format|
      format.html { redirect_to nius_url, notice: "Niu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_niu
      @niu = Niu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def niu_params
      params.require(:niu).permit(:nius_user_id, :title, :headline, :content)
    end
end
