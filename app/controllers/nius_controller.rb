class NiusController < ApplicationController
  # before_action :set_niu, only: %i[ show edit update destroy ]
  before_action :authenticate_nius_user!, except: [:index, :show]
  # before_action :validate_comment_edition, only: %i[ show edit update destroy ]
  # GET /nius or /nius.json
  def index
    @nius = Niu.all
  end

  # GET /nius/1 or /nius/1.json
  def show
    @niu = Niu.find(params[:id])
    @comments = @niu.comments
    
  end

  # def comment_add
  #   @niu = params[:id].nil? ? Niu.new : Niu.find(params[:id])
  #   @comment = @niu.comments.build
  #   # render partial: 'existing_client_fields', locals: { ff: @niu, f: @client }
  #   render partial: 'nius/comment_add'
  # end
  # def comment_create
  #   @niu = params[:id].nil? ? Niu.new : Niu.find(params[:id])
  #   comment = Comment.new(comment_params)
  #   comment.niu = @niu
  #   if comment.save
  #     # Instead of redirecting like we normally would, we render a partial for our Stimulus controller to handle

  #     # Note that we're just rendering HTML here, no need to render jbuilders or js partials

  #     render partial: 'nius/comment_view', locals: { comment: comment }, status: :ok
  #   else
  #     render partial: 'nius/comment_add', locals: { comment: comment }, status: :unprocessable_entity
  #   end
  # end

  # GET /nius/new
  def new
    @niu = Niu.new
    # @niu.comments.build
  end

  # GET /nius/1/edit
  def edit
    @niu = Niu.find(params[:id])
    # @comments = @niu.comments
  end
  def comment_new
    @niu = params[:id].nil? ? Niu.new : Niu.find(params[:id])
    # @comment = @niu.comments.build
    # render partial: 'existing_client_fields', locals: { ff: @niu, f: @client }
    render partial: 'comment_new'
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
    @niu = Niu.find(params[:id])
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
    # Only allow a list of trusted parameters through.
    def niu_params
      params.require(:niu).permit(:nius_user_id, :title, :headline, :content, 
        comments_attributes: [:_destroy, :id, :content, :nius_user_id])
    end

    def validate_comment_edition
      
    end

end
