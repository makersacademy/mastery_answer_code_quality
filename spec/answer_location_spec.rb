require "mastery_answer_code_quality/answer_location"

RSpec.describe AnswerLocation do
  describe "::new" do
    it "rejects a spec path without a leading `/`" do
      expect { described_class.new("blah/spec/question_1_spec.rb") }
        .to raise_error("Bad spec path")
    end

    it "rejects a spec path without `/spec/`" do
      expect { described_class.new("/blah/question_1_spec.rb") }
        .to raise_error("Bad spec path")
    end

    it "rejects a spec path without a `question_...`" do
      expect { described_class.new("/blah/spec/1_spec.rb") }
        .to raise_error("Bad spec path")
    end

    it "rejects a spec path without a question number" do
      expect { described_class.new("/blah/spec/question__spec.rb") }
        .to raise_error("Bad spec path")
    end

    it "rejects a spec path without a trailing _spec.rb" do
      expect { described_class.new("/blah/spec/question__spec.rb") }
        .to raise_error("Bad spec path")
    end

    it "accepts a spec path with all required elements" do
      expect { described_class.new("/blah/spec/question_1_spec.rb") }
        .to_not raise_error
    end
  end

  describe "#path" do
    subject { described_class.new("/blah/spec/question_1_spec.rb") }

    it "returns path w/ spec not questions, no _spec, same question num" do
      expect(subject.path).to eq("/blah/questions/question_1.rb")
    end
  end
end
