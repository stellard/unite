# -*- encoding : utf-8 -*-
module Unite
  class SimpleUnit

    include ActiveModel::Validations
    include Dimension::Integer

    attr_accessor :dimension, :name, :si_factor
    alias :to_s :name

    validates_inclusion_of :dimension, :in => Dimension::LIST
    validates_presence_of :si_factor, :dimension
    validates_format_of :name, :with => /\A[^\s*\/\^]+\Z/, :allow_blank => true, :message => "cannot contain *, / or ^"

    def dimension_vector
      @dimension_vector ||= Dimension::VECTOR_LIST.map{|d| d == dimension ? 1 : 0 }
    end

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

  end
end
