require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:sinopsis) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_presence_of(:author_id) }
  end

  context "associations" do
    it { is_expected.to belong_to(:author) }
  end
end
