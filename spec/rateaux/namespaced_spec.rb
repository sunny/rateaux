# frozen_string_literal: true

require "spec_helper"
require "rateaux/namespaced"

describe Rateaux::Namespaced do
  describe "#namespaced" do
    let(:rake) do
      double(:rake, task: nil, namespace: nil).extend(described_class)
    end

    pending "yields inside the namespace"

    it "adds a namespace" do
      rake.namespaced(:foo)

      expect(rake).to have_received(:namespace)
    end

    it "adds a default task" do
      rake.namespaced(:foo)

      expect(rake).to have_received(:task).with(foo: "foo:default")
    end

    it "adds the given task as a default" do
      rake.namespaced(:foo, :bar)

      expect(rake).to have_received(:task).with(foo: "foo:bar")
    end

    it "adds a list of given tasks as a default" do
      rake.namespaced(:foo, %i[bar spam])

      expect(rake).to have_received(:task).with(foo: ["foo:bar", "foo:spam"])
    end
  end
end
