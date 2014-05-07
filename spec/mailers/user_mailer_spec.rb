require "spec_helper"

describe UserMailer do
  pending "add some examples to (or delete) #{__FILE__}"


  let(:user) {User.new(name: 'Mel', email: 'mel.zhang@wellesley.edu')}
  it "sends a welcome email" do
    expect { UserMailer.welcome_email(@user) }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end

