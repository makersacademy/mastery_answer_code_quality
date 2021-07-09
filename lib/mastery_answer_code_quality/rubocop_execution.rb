require "open3"

class RubocopExecution
  attr_reader :problems

  def initialize(rubocop_config_path, answer_location, open_3_class=Open3)
    @whole_output = open_3_class.capture3("rubocop",
      answer_location.path,
      "-c",
      rubocop_config_path)
    @problems, _, @status = @whole_output
  end

  def successful?
    @status.success?
  end

  def whole_output
    @whole_output
  end
end
