class Task
  attr_reader :description

  def initialize(description)
    @description = description
    @complete = false
  enddsada
  

  def complete?
    @complete
  end

  def complete!
    @complete = true
  end
end
