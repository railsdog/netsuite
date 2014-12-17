module NetSuite
  module Records
    class CustomerAddressbook
      include Support::Fields
      include Support::Records
      include Support::RecordRefs
      include Namespaces::ListRel

      # internalId is a bit strange on this record
      # https://github.com/NetSweet/netsuite/wiki/Miscellaneous-Web-Services-Quirks#customer

      fields :default_shipping, :default_billing, :is_residential, :label, :internal_id
      #TS, :attention, :addressee, :phone, :addr1, :addr2, :addr3, :city, :zip, :override, :state

      field :country, NetSuite::Support::Country

      field :addressbook_address, Address

      #TS read_only_fields :addr_text

      def initialize(attributes_or_record = {})

        puts "INIT CustomerAddressbook #{attributes_or_record}"
        case attributes_or_record
        when self.class
          initialize_from_record(attributes_or_record)
        when Hash
          attributes_or_record = attributes_or_record[:addressbook] if attributes_or_record[:addressbook]
          initialize_from_attributes_hash(attributes_or_record)
          addressbook_address = RecordRef.new(attributes_or_record[:addressbook_address])
        end
      end

      def initialize_from_record(obj)
        self.default_shipping       = obj.default_shipping
        self.default_billing        = obj.default_billing
        self.is_residential         = obj.is_residential
        self.label                  = obj.label
        self.country                = obj.country
        self.addressbook_address    = obj.addressbook_address
        self.internal_id            = obj.internal_id
      end

    end
  end
end
