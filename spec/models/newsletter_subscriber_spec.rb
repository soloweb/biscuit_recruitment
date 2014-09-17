require 'spec_helper'

describe NewsletterSubscriber do
  it "creates a newsletter subscriber" do
    @subscriber = NewsletterSubscriber.create(email: 'jack@soloweb.com')
    expect(NewsletterSubscriber.all.count).to eq(1)
  end

  it "validates against an empty email" do
    @subscriber = NewsletterSubscriber.create(email: '')
    expect(@subscriber.valid?).to eq(false)
  end

  it "validates against a duplicated email" do
    @subscriber = NewsletterSubscriber.create(email: 'jack@soloweb.com')
    @subscriber_2 = NewsletterSubscriber.create(email: 'jack@soloweb.com')
    expect(@subscriber_2.valid?).to eq(false)
  end
end
