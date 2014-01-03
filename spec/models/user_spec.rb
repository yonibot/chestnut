# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string(255)
#  location         :string(255)
#  alpha            :boolean
#  profile_picture  :string(255)
#  registered       :boolean
#

require 'spec_helper'

describe User do
    
  it { should have_many(:book_ownerships).with_foreign_key('owner_id')}
  it { should have_many(:book_borrowings).with_foreign_key('borrower_id')}
  it { should have_many(:facebook_friends)}

  describe "#get_fb_friends", :vcr do
    it "adds UserFriendship records for each fb friend"

    it "does not add double records for existing fb friends"

    it "deletes UserFriendship records when a user loses a fb friend"
  end


end
