require 'spec_helper'


describe UserFriendshop do

  it { should belong_to(:user)}
  it { should belong_to(:fb_friend).class_name:('User')}

end