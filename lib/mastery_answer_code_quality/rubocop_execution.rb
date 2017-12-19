require "open3"

class RubocopExecution
  attr_reader :problems

  def initialize(rubocop_config_path, answer_location, open_3_class=Open3)
    @problems, _, @status =
      open_3_class.capture3("rubocop",
                            answer_location.path,
                            "-c",
                            rubocop_config_path)
  end

  def successful?
    @status.success?
  end
end
