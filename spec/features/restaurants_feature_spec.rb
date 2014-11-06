require 'rails_helper'

describe 'Restaurants' do

	context 'at the beginning no restaurants should have been added' do

		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
			expect(page).to have_link 'Add a restaurant'
		end

	end

	context 'viewing restaurants' do

		before do
			User.create(id: 1, email: 'test@example.com', password:'password', password_confirmation:'password')
			@kfc = Restaurant.create(name: 'KFC', user_id: 1)
		end

		it 'should display restaurants' do
			visit '/restaurants'
			expect(page).to have_content 'KFC'
			expect(page).not_to have_content 'No restaurants yet'
		end

		it 'lets a user view a restaurant' do
			visit '/restaurants'
			click_link 'KFC'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq "/restaurants/#{@kfc.id}"
		end

	end

	context 'Creating restaurants' do

		it 'if not logged in, error is shown' do
			visit '/'
			click_link('Add a restaurant')
			expect(page).to have_content('You need to sign in or sign up before continuing')
		end

		it 'if logged in, prompts user to fill out a form, then displays the new restaurant' do
			sign_up
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'KFC'
			click_button 'Create Restaurant'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
		end

	end

	context 'editing restaurants' do

		before do
			User.create(id: 1, email: 'test@example.com', password:'password', password_confirmation:'password')
			@kfc = Restaurant.create(name: 'KFC', user_id: 1)
		end

		it 'lets a user edit a restaurant' do
			visit '/restaurants'
			sign_up
			click_link 'Edit KFC'
			fill_in 'Name', with: 'Kentucky Fried Chicken'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Kentucky Fried Chicken'
			expect(current_path).to eq '/restaurants'
		end

	end

	context 'deleting restaurants' do

		before do
			User.create(id: 1, email: 'test@example.com', password:'password', password_confirmation:'password')
			@kfc = Restaurant.create(name: 'KFC', user_id: 1)
		end

		it 'removes a restaurant when a user clicks a delete link if the user is logged in' do
			sign_in
			visit '/restaurants'
			click_link 'Delete KFC'
			expect(page).not_to have_content 'KFC'
			expect(page).to have_content 'Restaurant deleted successfully'
		end

		it 'raises error if the user didnt create the restaurant' do
			Restaurant.create(name: 'Velo', user_id: '1')
			sign_up
			visit '/restaurants'
			click_link 'Delete Velo'
			expect(page).to have_content 'Velo'
			expect(page).to have_content 'Permission denied'
		end

	end

	context 'a restaurant is invalid' do

		it 'if the name that is too short' do
			sign_up
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'kf'
			click_button 'Create Restaurant'
			expect(page).not_to have_css 'h2', text: 'kf'
			expect(page).to have_content 'error'
		end

	end

	def sign_up
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: 'testtest')
		fill_in('Password confirmation', with: 'testtest')
		click_button('Sign up')
	end

	def sign_in
		visit '/'
		click_link('Sign in')
		fill_in('Email', with: 'test@example.com')
		fill_in('Password', with: 'password')
		click_button('Log in')
	end


end
