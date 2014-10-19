module NetSuite
  module Records
    class File
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::FileCabinet

      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2014_1/schema/record/file.html

      actions :get, :add, :delete, :search, :get_list

      fields :content, :description, :name, :media_type_name, :file_type, :text_file_encoding

      record_refs :klass

      read_only_fields :url

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end
    end
  end
end
