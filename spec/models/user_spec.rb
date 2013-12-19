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
#  fb_friends       :text
#

require 'spec_helper'

describe User do
    
  it { should have_many(:book_ownerships).with_foreign_key('owner_id')}
  it { should have_many(:book_borrowings).with_foreign_key('borrower_id')}

  it "caches the user's fb_friends after login" do
    
  end

  end

end