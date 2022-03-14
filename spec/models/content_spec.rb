require 'rails_helper'

RSpec.describe "Contents", type: :model do
  describe "valid_check" do
    it "title_idが重複すると追加できない" do
      content1 = create(:content)
      content2 = create(:content)
      content2.title_id = content1.title_id
      expect(content2).not_to be_valid
    end
  end
end
