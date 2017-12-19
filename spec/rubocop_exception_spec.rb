require "mastery_answer_code_quality/rubocop_execution"

RSpec.describe RubocopExecution do
  let :rubocop_config_path { double(:rubocop_config_path) }
  let :answer_location { double(:answer_location) }
  let :open_3_class { double(:open_3_class) }

  describe "::new" do
    it "runs Rubocop on passed answer_location path using `Open3.capture3`" do
      expect(answer_location).to receive(:path).and_return("answer path")
      expect(open_3_class)
        .to receive(:capture3).with("rubocop",
                                    "answer path",
                                    "-c",
                                    rubocop_config_path)

      described_class.new(rubocop_config_path, answer_location, open_3_class)
    end
  end

  describe "#successful?" do
    subject { described_class.new(rubocop_config_path,
                                  answer_location,
                                  open_3_class) }
    let :status { double(:status) }

    it "calls `success?` on status and returns result" do
      allow(answer_location).to receive(:path)
      expect(status).to receive(:success?).and_return(true)
      expect(open_3_class)
        .to receive(:capture3).and_return([nil, nil, status])

      expect(subject).to be_successful
    end
  end

  describe "#problems" do
    subject { described_class.new(rubocop_config_path,
                                  answer_location,
                                  open_3_class) }
    let :problems { double(:problems) }

    it "returns problems returned by capture3" do
      allow(answer_location).to receive(:path)
      expect(open_3_class)
        .to receive(:capture3).and_return([problems, nil, nil])

      expect(subject.problems).to eq(problems)
    end
  end
end
