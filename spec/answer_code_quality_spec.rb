require "mastery_answer_code_quality/answer_code_quality"

RSpec.describe AnswerCodeQuality do
  let :rubocop_execution { double(:rubocop_execution) }

  describe "::new" do
    it "creates new object with a RubocopExecution object" do
      expect { described_class.new(rubocop_execution) }.to_not raise_error
    end
  end

  describe "#acceptable?" do
    subject { described_class.new(rubocop_execution) }

    it "returns rubocop_execution success" do
      expect(rubocop_execution).to receive(:successful?)
      subject.acceptable?
    end
  end

  describe "#problems" do
    subject { described_class.new(rubocop_execution) }

    it "returns rubocop_execution problems" do
      expect(rubocop_execution).to receive(:problems)
      subject.problems
    end
  end
end
