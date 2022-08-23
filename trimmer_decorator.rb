require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    "TrimmerDecorator(#{@nameable.correct_name})"
  end
end