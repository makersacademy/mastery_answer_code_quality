require "mastery_answer_code_quality"

RSpec.describe MasteryAnswerCodeQuality do
  it "has a version number" do
    expect(described_class::VERSION).not_to be nil
  end

  describe "::build" do
    let :spec_location { double(:spec_location) }

    let :answer_location_class { double(:answer_location_class) }
    let :answer_location { double(:answer_location) }

    let :answer_path { double(:answer_path) }

    let :rubocop_execution_class { double(:rubocop_execution_class) }
    let :rubocop_execution { double(:rubocop_execution) }

    let :answer_code_quality_class { double(:answer_code_quality_class) }
    let :answer_code_quality { double(:answer_code_quality) }

    it "builds and returns an answer_code_quality object" do
      expect(answer_location_class)
        .to receive(:new)
              .with(spec_location)
              .and_return(answer_location)

      allow(answer_location)
        .to receive(:path)
              .and_return(answer_path)

      expect(rubocop_execution_class)
        .to receive(:new)
              .with(/.rubocop.yml/,
                    answer_location)
              .and_return(rubocop_execution)

      expect(answer_code_quality_class)
        .to receive(:new)
              .with(rubocop_execution)
              .and_return(answer_code_quality)

      expect(described_class.build(spec_location,
                                   answer_location_class,
                                   rubocop_execution_class,
                                   answer_code_quality_class))
        .to eq(answer_code_quality)
    end
  end
end
