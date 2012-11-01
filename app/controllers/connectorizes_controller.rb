class ConnectorizesController < ApplicationController
  # GET /connectorizes
  # GET /connectorizes.json
  def index
    @connectorizes = Connectorize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @connectorizes }
    end
  end

  # GET /connectorizes/1
  # GET /connectorizes/1.json
  def show
    @connectorize = Connectorize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @connectorize }
    end
  end

  # GET /connectorizes/new
  # GET /connectorizes/new.json
  def new
    @connectorize = Connectorize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @connectorize }
    end
  end

  # GET /connectorizes/1/edit
  def edit
    @connectorize = Connectorize.find(params[:id])
  end

  # POST /connectorizes
  # POST /connectorizes.json
  def create
    @connectorize = Connectorize.new(params[:connectorize])

    respond_to do |format|
      if @connectorize.save
        format.html { redirect_to @connectorize, notice: 'Connectorize was successfully created.' }
        format.json { render json: @connectorize, status: :created, location: @connectorize }
      else
        format.html { render action: "new" }
        format.json { render json: @connectorize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /connectorizes/1
  # PUT /connectorizes/1.json
  def update
    @connectorize = Connectorize.find(params[:id])

    respond_to do |format|
      if @connectorize.update_attributes(params[:connectorize])
        format.html { redirect_to @connectorize, notice: 'Connectorize was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @connectorize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connectorizes/1
  # DELETE /connectorizes/1.json
  def destroy
    @connectorize = Connectorize.find(params[:id])
    @connectorize.destroy

    respond_to do |format|
      format.html { redirect_to connectorizes_url }
      format.json { head :no_content }
    end
  end
end
