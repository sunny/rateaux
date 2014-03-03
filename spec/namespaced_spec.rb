# encoding: UTF-8

require 'spec_helper'
require 'rateaux/namespaced'

describe "#namespaced" do
  # Fake Rake
  let(:rake) {
    double(:rake, task: nil, namespace: nil).extend(Rateaux::Namespaced)
  }

  it "adds a namespace" do
    rake.namespaced(:foo)

    expect(rake).to have_received(:namespace)
  end

  # it 'yields inside the namespace'

  it 'adds a default task' do
    rake.namespaced(:foo)

    expect(rake).to have_received(:task).with(foo: :"foo:default")
  end

  it 'adds the given task as a default' do
    rake.namespaced(:foo, :bar)

    expect(rake).to have_received(:task).with(foo: :"foo:bar")
  end

  it 'adds a list of given tasks as a default' do
    rake.namespaced(:foo, [:bar, :spam])

    expect(rake).to have_received(:task).with(foo: [:"foo:bar", :"foo:spam"])
  end

end
