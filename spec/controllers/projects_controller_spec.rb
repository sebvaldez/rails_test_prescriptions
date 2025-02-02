require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
		describe 'POST#create' do

			it 'creates a project' do
				post :create, params: {project: { name: 'Runway', tasks: 'Start something:2' }}
				expect(response).to redirect_to(projects_path)
				expect(assigns(:action).project.name).to eq('Runway')
			end

			it 'goes back to form on failure' do
				# create project without name, checking validations
				post :create, params: {project: {name: '', tasks: ''}}
				expect(response).to render_template(:new)
				expect(assigns(:project)).to be_present
			end
		end

end
