# -*- encoding : utf-8 -*-
module Unity
  class SimpleUnit

    include ActiveModel::Validations
    include Dimension::Integer

    attr_accessor :dimension, :name, :si_factor
    alias :to_s :name

    validates_inclusion_of :dimension, :in => Dimension::LIST
    validates_presence_of :si_factor, :dimension, :name
    validates_format_of :name, :with => /\A[^\s*\/\^]+\Z/, :message => "cannot contain *, / or ^"

    def dimension_vector
      @dimension_vector ||= Dimension::LIST.map{|d| d == dimension ? 1 : 0 }
    end

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

  end
end
