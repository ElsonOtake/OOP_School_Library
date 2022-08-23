require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    "CapitalizeDecorator(#{@nameable.correct_name})"
  end
end