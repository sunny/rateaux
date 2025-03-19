# frozen_string_literal: true

require "spec_helper"
require "rateaux/file_task"

describe Rateaux::FileTask do
  describe "#file_task" do
    let(:rake) do
      double(:rake, task: nil, file: nil).extend(described_class)
    end

    it "adds a task" do
      rake.file_task "foo.txt", bar: :spam

      expect(rake).to have_received(:task).with(bar: :spam)
    end

    it "adds a file" do
      rake.file_task "foo.txt", :foo

      expect(rake).to have_received(:file).with("foo.txt")
    end

    pending "yields inside the task"
    pending "calls the task inside the file definition"
  end
end
