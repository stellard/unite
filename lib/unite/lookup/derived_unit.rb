# -*- encoding : utf-8 -*-
module Unite
  class DerivedUnit

    include ActiveModel::Validations
    include Dimension::Vector
    include Conversion

    attr_accessor :name, :numerator, :denominator, :value, :aliases

    alias :to_s :name
    validates_presence_of :name
    validates_format_of :name, :with => /\A[^\s*\/\^]+\Z/, :message => "cannot contain *, / or ^"

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      super
    end

    def aliases
      @aliases ||= []
    end

  end
end
