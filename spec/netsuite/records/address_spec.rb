require 'spec_helper'

describe NetSuite::Records::Address do
  
  let(:address) { NetSuite::Records::Address.new }

  it 'has all the right fields' do
    [
      :attention, :addressee, :addr_phone, :addr1, :addr2,
      :addr3, :city, :state, :zip, :addr_text
    ].each do |field|
      address.should have_field(field)
    end
  end

  describe '#to_record' do
    before do
      address.attention   = 'Mr. Autechre'
      address.addressee   = 'Mr. IDM Autechre'
      address.addr_phone  = '1234567890'
      address.addr1       = '808 drum machine lane'
      address.addr2       = '#303'
      address.addr3       = 'Box 909'
      address.city        = 'Bristol'
      address.state       = 'CA'
      address.zip         = '90007'
      address.country     = '_unitedStates'
    end

    it 'can represent itself as a SOAP record' do
      record = {
        'platformCommon:attention'  => 'Mr. Autechre',
        'platformCommon:addressee'  => 'Mr. IDM Autechre',
        'platformCommon:addrPhone'  => '1234567890',
        'platformCommon:addr1'      => '808 drum machine lane',
        'platformCommon:addr2'      => '#303',
        'platformCommon:addr3'      => 'Box 909',
        'platformCommon:city'       => 'Bristol',
        'platformCommon:state'      => 'CA',
        'platformCommon:zip'        => '90007',
        'platformCommon:country'    => '_unitedStates'
      }
      expect(address.to_record).to eql(record)
    end
  end

  describe 'record_namespace' do
    it 'belongs to the platformCommon namespace' do
      address.record_namespace.should eql('platformCommon')
    end
  end

end
