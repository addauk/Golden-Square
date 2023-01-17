require 'password_checker'

RSpec.describe PasswordChecker do

  it "fails when password is less than 8 characters" do
    password_checker = PasswordChecker.new
    expect{ password_checker.check("short ")}.to raise_error "Invalid password, must be 8+ characters."
  end

  it "Accepts passwords at least 8 characters long" do
    password_checker = PasswordChecker.new
    expect(password_checker.check("password")).to eq true
  end

end
