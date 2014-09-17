require 'spec_helper'

describe VacancyApplication do
  it "creates an application" do
    @vacancy_application = Fabricate(:vacancy_application)
    expect(VacancyApplication.all.count).to eq(1)
  end

  it "creates an application with an attached pdf" do
    @file = File.new(Rails.root + 'spec/sample_files/test_document.pdf')
    @vacancy_application = Fabricate(:vacancy_application, cv: @file)
    expect(VacancyApplication.all.count).to eq(1)
  end

  it "creates an application with an attached .doc" do
    @file = File.new(Rails.root + 'spec/sample_files/test_document.doc')
    @vacancy_application = Fabricate(:vacancy_application, cv: @file)
    expect(VacancyApplication.all.count).to eq(1)
  end

  it "creates an application with an attached .docx" do
    @file = File.new(Rails.root + 'spec/sample_files/test_document.docx')
    @vacancy_application = Fabricate(:vacancy_application, cv: @file)
    expect(VacancyApplication.all.count).to eq(1)
  end

  it "creates an application with an attached .txt" do
    @file = File.new(Rails.root + 'spec/sample_files/test_document.txt')
    @vacancy_application = Fabricate(:vacancy_application, cv: @file)
    expect(VacancyApplication.all.count).to eq(1)
  end

  it "does not create an application if an incorrect file type is attached as a cv" do
    @file = File.new(Rails.root + 'spec/sample_files/test_document.jpg')
    expect{ Fabricate(:vacancy_application, cv: @file) }.to raise_error
  end

  it "does not create an application if an file uses a fake extension" do
    @file = File.new(Rails.root + 'spec/sample_files/fake_doc.doc')
    expect{ Fabricate(:vacancy_application, cv: @file) }.to raise_error
  end

  it "creates an application with an attached .odt" do
    @file = File.new(Rails.root + 'spec/sample_files/test_document.odt')
    @vacancy_application = Fabricate(:vacancy_application, cv: @file)
    expect(VacancyApplication.all.count).to eq(1)
  end
end
