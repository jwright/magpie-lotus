require "features_helper"

describe "Signing in" do
  let(:user) { User.new email: "jimmy@example.com", username: "jimmy" }

  describe "on successful signin" do
    before { UserRepository.persist user }

    it "redirects to the lists" do
      visit "/signin"

      fill_in "Email", with: user.email
      fill_in "Password", with: "p@ssword"
      click_button "Sign In"

      current_path.must_equal "/lists"
    end
  end
end
