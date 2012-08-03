class ConferencesController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :new, :edit, :update, :destroy, :show]
  before_filter :editor_user, only: [:new, :create, :update, :edit]
  before_filter :viewer_user, only: [:index]
  before_filter :admin_user,     only: :destroy

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.all(order: 'conf_date DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conferences }
    end
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
    @conference = Conference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conference }
    end
  end

  # GET /conferences/new
  # GET /conferences/new.json
  def new
    @conference = Conference.create(conf_date: Date.today)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conference }
    end
  end

  # GET /conferences/1/edit
  def edit
    @conference = Conference.find(params[:id])
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(params[:conference])

    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render json: @conference, status: :created, location: @conference }
      else
        format.html { render action: "new" }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conferences/1
  # PUT /conferences/1.json
  def update
    @conference = Conference.find(params[:id])

    respond_to do |format|
      if @conference.update_attributes(params[:conference])
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference = Conference.find(params[:id])
    @conference.destroy

    respond_to do |format|
      format.html { redirect_to conferences_url }
      format.json { head :no_content }
    end
  end


  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      if !current_user.editor?
        flash[:error] = "You are not an administrator."
        redirect_to current_user
      end
    end

    def editor_user
      if !current_user.editor?
        flash[:error] = "You do not have conference editing privileges."
        redirect_to current_user
      end
    end

    def viewer_user
      if !current_user.viewer?
        flash[:error] = "You do not yet have conference viewing privileges."
        redirect_to current_user
      end
    end
end
