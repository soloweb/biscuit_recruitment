require 'spec_helper'

describe Vacancy do
  it "creates a vacancy" do
    @vacancy = Fabricate(:vacancy)
    expect(Vacancy.all.count).to eq(1)
  end
end
