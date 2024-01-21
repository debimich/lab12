class DefinitionsController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :get_definitions, only: %i[new create destroy]

  def new
  end

  def create
    @definition = Definition.new(def: @definition_params[:def], User: current_user)

    if @definition.save
      redirect_to(request.referrer, notice: 'Вы успешно добавили определение')
    else
      redirect_to(request.referrer, alert: @definition.errors.full_messages[0])
    end
  end

  def destroy
    Definition.delete(params[:id])
  end

  def show
    @definition_required = Definition.find_by(id: params[:definition_id])
    @values = @definition_required.Values
    if @values.nil?
      @values = []
    end
  end

  def set_params
    @definition_params = params.require(:definitions).permit(:def)
  end
  def get_definitions
    @definitions = Definition.all
  end
end
