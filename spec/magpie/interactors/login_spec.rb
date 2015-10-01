require 'spec_helper'

describe Login do
  let(:email) { "jimmy@example.com" }
  let(:params) { Hash[user: { email: email, password: "p@ssword" }] }
  let(:user) { User.new username: "jimmy", email: email }
  subject { Login.new(params) }

  before { def params.valid?; true end }
  after { UserRepository.clear }

  it "is not successful if the params are not valid" do
    def params.valid?; false end
    subject.call.success?.must_equal false
  end

  it "is not successful if the user does not exist" do
    subject.call.success?.must_equal false
  end

  it "is successful if the user exists" do
    expected = UserRepository.persist user
    result = subject.call
    result.success?.must_equal true
    result.user.must_equal expected
  end
end
