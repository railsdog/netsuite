module NetSuite
  module Records
    class Address
      include Namespaces::PlatformCommon
      include Support::Fields
     # include Support::RecordRefs
      #include Support::Records
     # include Support::Actions

      # This introduced to support 2014_2
      # Customeraddressbook now contains a field addressbookAddress of type Address
      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2014_2/schema/other/customeraddressbook.html?mode=package

      fields :addr1, :addr2, :addr3, :addressee, :addr_phone, :addr_text, :attention, :city, :state, :zip

      field :country, NetSuite::Support::Country

      field :custom_field_list, CustomFieldList

      read_only_fields :addr_text

      attr_reader :internal_id

      def initialize(attrs = {})
        #@internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        initialize_from_attributes_hash(attrs)
      end

      def initialize_from_record(obj)
        self.addr1            = obj.addr1
        self.addr2            = obj.addr2
        self.addr3            = obj.addr3
        self.attention        = obj.attention
        self.addressee        = obj.addressee
        self.addr_phone       = obj.addr_phone
        self.addr_text        = obj.addr_text
        self.city             = obj.city
        self.state            = obj.state
        self.zip              = obj.zip
        self.country          = obj.country
        self.override         = obj.override
        self.internal_id      = obj.internal_id
      end

    end
  end
end
