require 'rails_helper'

RSpec.describe "Films", type: :request do
  describe "GET films#index" do
    context "when the user is an admin" do
      user = create(:admin)
      approved_films = create_list(:film, 10, approved: true)
      unapproved_films = create_list(:film, 5, approved: false)
      films = approved_films + unapproved_films

      it "should list of all films" do
        login_as(user)
        visit films_path

        expect(films.count).to eq (approved_films.count + unapproved_films.count)
      end
    end

    context "when the user is an editor" do
      user = create(:editor)
      approved_films = create_list(:film, 10, approved: true)
      unapproved_films = create_list(:film, 5, approved: false)
      films = approved_films + unapproved_films

      it "should list of all films" do
        login_as(user)
        visit films_path

        expect(films.count).to eq (approved_films.count + unapproved_films.count)
      end
    end

    context "when the user is an describer" do
      user = create(:describer)
      approved_films = create_list(:film, 10, approved: true)
      unapproved_films = create_list(:film, 5, approved: false)
      films = approved_films + unapproved_films

      it "should list of approved films" do
        login_as(user)
        visit films_path

        expect(films.count).to eq approved_films.count
      end
    end

    context "when the user is not exist" do
      approved_films = create_list(:film, 10, approved: true)
      unapproved_films = create_list(:film, 5, approved: false)
      films = approved_films + unapproved_films
      
      it "should list of approved films" do
        visit films_path

        expect(films.count).to eq approved_films.count
      end
    end
  end
end
