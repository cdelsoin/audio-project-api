class PresetsController < OpenReadController
  before_action :set_preset, only: [:show, :update, :destroy]

  # GET /presets
  # GET /presets.json
  def index
    # @presets = Preset.all
    if params[:user_presets] == "true"
      @presets = current_user.presets
    else
      @presets = Preset.all
    end

    render json: @presets
  end

  # GET /presets/1
  # GET /presets/1.json
  def show
    render json: @preset
  end

  # POST /presets
  # POST /presets.json
  def create
    # @preset = Preset.new(preset_params)
    @preset = current_user.presets.build(preset_params)

    if @preset.save
      render json: @preset, status: :created, location: @preset
    else
      render json: @preset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /presets/1
  # PATCH/PUT /presets/1.json
  def update
    # @preset = current_user.presets.find(params[:id])

    if @preset.update(preset_params)
      head :no_content
    else
      render json: @preset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /presets/1
  # DELETE /presets/1.json
  def destroy
    @preset.destroy

    head :no_content
  end

  def set_preset
    @preset = Preset.find(params[:id])
    # @preset = current_user.presets.find(params[:id])
  end

  def preset_params
    params.require(:preset).permit(:name, :rain, :fire, :thunder, :crickets, :birds, :coffee, :waves, :bowl)
  end

  private :set_preset, :preset_params
end
