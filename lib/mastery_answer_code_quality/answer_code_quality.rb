class AnswerCodeQuality
  def initialize(rubocop_execution)
    @rubocop_execution = rubocop_execution
  end

  def acceptable?
    successful = rubocop_execution.successful?
    
    if !successful
      puts "Printing rubocop output for debugging:"
      puts rubocop_execution.whole_output
    end

    successful
  end

  def problems
    rubocop_execution.problems
  end

  private

  attr_reader :rubocop_execution
end
