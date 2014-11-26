class EventData
  def self.build(params)
    new(params).build
  end

  attr_accessor :params, :data

  def initialize(params)
    @params = params
    @data   = String.new
  end

  def build
    data << open_string
    data << build_params
    data << close_string

    data
  end

  def open_string
    'data: '
  end

  def close_string
    "\n\n"
  end

  def build_params
    ['{', keys_values.join(', '), '}'].join(' ')
  end

  def keys_values
    params.map { |key, value| "\"#{key}\": \"#{value}\"" }
  end
end
