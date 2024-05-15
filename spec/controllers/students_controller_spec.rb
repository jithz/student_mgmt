require 'rails_helper'

RSpec.describe Admin::StudentsController do
  describe 'GET #index' do
    let(:student)  { create :student }
    let(:admin_user)  { create :admin_user }

    before(:each) do
      sign_in(admin_user)
      get :index
    end

    it 'assigns @students' do
      expect(assigns(:students)).to eq([student])
    end

    it 'renders the index template' do
      expect(response).to render_template("index")
    end

    it 'returns the status code ok' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:admin_user)  { create :admin_user }

    before(:each) do
      sign_in(admin_user)
    end

    context "with valid parameters" do
      let(:valid_params) { build(:student) }

      it 'should accept the params with html format' do
        post :create, params: { student: user_params }
        expect(response.media_type).to eq('text/html')
        expect(response.content_type).to eq('text/html; charset=utf-8')
      end

      it 'creates a new student when passing valid parameters' do
        expect { post :create, params: {student: user_params} }.to change(Student, :count).by(1)
      end

      it 'should redirect to students index page with notice' do
        post :create, params: { student: user_params }
        expect(response).to redirect_to(admin_students_path)
        expect(flash[:notice]).to eq('Student has been created successfully')
      end
    end

    context "with invalid parameters" do
      it "renders the new template" do
        post :create, params: { student: { name: nil, email: "john@example.com" } }
        expect(response).to render_template(:new)
      end

      it "should render the validation errors into forms" do
        post :create, params: { student: { name: nil, email: nil } }
        expect(assigns(:student).valid?).to_not eq(true)
        expect(response).to render_template('admin/students/new')
      end
    end
  end

  def user_params
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      date_of_birth: Faker::Date.birthday(min_age: 15),
      permanent_contact_number: Faker::PhoneNumber.phone_number,
      alternate_contact_number: Faker::PhoneNumber.phone_number,
      local_address: Faker::Address.full_address,
      permanent_address: Faker::Address.full_address
    }
  end

end