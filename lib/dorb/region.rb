module DORB
  class Region

    attr_accessor :id, :name
    
    def self.all
      {
        :new_york_1 => new('id' => 1, :name => 'New York 1'),
        :amsterdam_1 => new('id' => 2, :name => 'Amsterdam 1')
      }
    end

    def initialize( opts={} )
      options = opts.symbolize_keys
      required = Hash.new { |h,k| raise( "Attribute #{k.inspect} is required" ) }
      required.update(options)
      self.id = required[:id]
      self.name = required[:name]
    end

    def to_sym
      name.gsub(/\s/, '_').downcase.to_sym
    end

  end
end
