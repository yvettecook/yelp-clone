require 'rails_helper'

describe 'Viewing restaurants' do

	context 'no restaurants should have been added' do

		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
			expect(page).to have_link 'Add a restaurant'
		end

	end

	context 'restaurants have been added' do

		before do
			Restaurant.create(name: 'KFC')
		end

		it 'should display restaurants' do
			visit '/restaurants'
			expect(page).to have_content 'KFC'
			expect(page).not_to have_content 'No restaurants yet'
		end

	end

end

describe 'Creating restaurants' do

	it 'prompts user to fill out a form, then displays the new restaurant' do
		visit '/restaurants'
		click_link 'Add a restaurant'
		fill_in 'Name', with: 'KFC'
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(current_path).to eq '/restaurants'
	end

end

