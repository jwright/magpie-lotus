require 'lotus/interactor'

class Login
  include Lotus::Interactor

  expose :user

  def initialize(params)
    @params = params
  end

  def call
    @user = UserRepository.find_by_email @params[:user][:email]
    #TODO: Check password
    fail! if @user.nil?
  end

  private

  def valid?
    @params.valid?
  end
end
