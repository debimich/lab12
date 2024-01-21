class ValuesController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :get_values, only: %i[new create destroy]

  def new
  end

  def create
    @value = Value.new(val: @value_params[:val], User: current_user, Definition: Definition.find(@value_params[:definition]))

    if @value.save
      redirect_to(request.referrer, alert: 'Вы успешно добавили значение')
    else
      redirect_to(request.referrer, alert: @value.errors.full_messages[0])
    end
  end

  def destroy
    Value.delete(params[:id])
  end

  def set_params
    @value_params = params.require(:values).permit(:val, :definition)
  end
  def get_values
    @values = Value.all
  end
end
