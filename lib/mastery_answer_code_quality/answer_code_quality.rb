class AnswerCodeQuality
  def initialize(rubocop_execution)
    @rubocop_execution = rubocop_execution
  end

  def acceptable?
    rubocop_execution.successful?
  end

  def problems
    rubocop_execution.problems
  end

  private

  attr_reader :rubocop_execution
end
