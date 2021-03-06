require 'spec_helper'

describe 'ActiveRecord::Base#serialize' do
  subject { Master.create(id: 1, name: 'Object1', data: '123') }

  specify 'with default options without metadata' do
    json_data = { master: { id: 1, name: 'Object1', data: '123', slaves: [] } }.to_json
    subject.serialize(add_metadata: false).should == json_data 
  end

  specify 'with custom item serializer class' do
    json_data = { father: { id: 1, name: 'Object1', number: 14, slaves: [] } }.to_json
    subject.serialize(serializer: 'AnotherMasterSerializer').should == json_data 
  end
end
