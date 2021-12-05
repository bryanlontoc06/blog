require "rails_helper"

RSpec.describe "Auth Features", :type => :feature do
    describe 'Having a user their own credentials' do
        scenario "User creates a new Account" do 
            visit new_user_registration_path
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password', with: '123456'
            fill_in 'user_password_confirmation', with: '123456'
            click_on ('Sign up')
            expect(page).to have_text("Welcome! You have signed up successfully.")
        end

        scenario 'Invalid password match' do
            visit new_user_registration_path
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password', with: '123456'
            fill_in 'user_password_confirmation', with: '12345678'
            click_on ('Sign up')
            expect(page).to have_text("Password confirmation doesn't match Password")
        end

        scenario 'Password is too short (min 6 characters)' do
            visit new_user_registration_path
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password', with: '123'
            fill_in 'user_password_confirmation', with: '123'
            click_on ('Sign up')
            expect(page).to have_text("Password is too short (minimum is 6 characters)")
        end
    end

    describe 'Logging in User Accounts' do
        scenario 'Login user succesfully' do
            visit new_user_session_path
            create('user')
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password', with: '123456'
            click_on ('Log in')
            expect(page).to have_text("Signed in successfully.")
        end

        scenario 'Login user failed' do
            visit new_user_session_path
            create('user')
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password', with: '1234'
            click_on ('Log in')
            expect(page).to have_text("Invalid Email or password.")
        end
    end
end