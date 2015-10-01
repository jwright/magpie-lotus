require 'spec_helper'

describe UserRepository do
  describe ".find_by_email" do
    let(:email) { "jimmy@example.com" }
    let(:user_with_email) { User.new username: "robert", email: email }
    let(:user_with_different_email) { User.new username: "jimmy", email: "jimmy@example.com" }
    after { UserRepository.clear }

    it "returns the first user who has the specifed email" do
      expected = UserRepository.persist user_with_email
      UserRepository.persist user_with_different_email
      result = UserRepository.find_by_email email
      result.must_equal expected
    end
  end
end
