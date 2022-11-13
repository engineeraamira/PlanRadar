require 'rails_helper'

RSpec.describe User, type: :model do

    describe "validation of email" do
        subject { User.new }
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:password) }
        it { should validate_presence_of(:email) }
        #it { should validate_uniqueness_of(:email) }  
    end
end
