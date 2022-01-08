require 'rails_helper'
require 'devise'
require File.expand_path('../config/environment', __dir__)

RSpec.describe FilmsController, type: :request do
  describe "GET films#index" do
    let(:approved_number) { 5 }
    let(:unapproved_number) { 10 }
    let(:film_approved) { create_list(:film, approved_number) }
    #let(:film_unapproved) { create_list(:film_approved, unapproved_number, approved: false) }
    # let!(:films) do
    #   film_approved #+ film_unapproved
    # end

    context "when the user is an admin" do
      let!(:user) { create(:user, role: "admin") }
      it "should list of all films" do
        binding.pry

        sign_in(user)
        get :index
        expect(:films.size).to eq(approved_number + unapproved_number)
      end
    end

    # context "when the user is an editor" do
    #   let(:user) { create(:editor) }

    #   it "should list of all films" do
    #     login_as(user)
    #     visit films_path

    #     expect(films.count).to eq (approved_films.count + unapproved_films.count)
    #   end
    # end

    # context "when the user is an describer" do
    #   let(:user) { create(:describer) }

    #   it "should list of approved films" do
    #     login_as(user)
    #     visit films_path

    #     expect(films.count).to eq approved_films.count
    #   end
    # end

    # context "when the user is not exist" do
    #   it "should list of approved films" do
    #     visit films_path

    #     expect(films.count).to eq approved_films.count
    #   end
    # end
  end
end
