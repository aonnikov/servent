RSpec.describe Servent::Event do
  context "data:" do
    it "recognizes a simple `data: omg` stream" do
      event = described_class.new "data: omg"

      expect(event).to be_event("message", "omg")
    end

    it 'removes just one space from message `data:\s\somg`' do
      event = described_class.new "data:\s\somg"

      expect(event).to be_event("message", " omg")
    end
  end

  context "custom event types" do
    it 'recognizes a type with its content `event: omg\ndata: lol`' do
      event = described_class.new "event: omg\ndata: lol"

      expect(event).to be_event("omg", "lol")
    end
  end

  context "specification examples" do
    it "recongnizes the generic multilined event stream" do
      stream = "data: YHOO\ndata: +2\ndata: 10"
      event  = described_class.new stream

      expect(event).to be_event("message", "YHOO\n+2\n10")
    end
  end
end
