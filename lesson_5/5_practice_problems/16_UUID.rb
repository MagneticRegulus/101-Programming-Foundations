# Write a method that returns one UUID when called with no parameters.

HEX_RANGE = (16..255).to_a


def uuid
  uuid_ary = []
  uuid_ary << Array.new(4) { |idx| idx = HEX_RANGE.sample}
  3.times do
    uuid_ary << Array.new(2) { |idx| idx = HEX_RANGE.sample}
  end
  uuid_ary << Array.new(6) { |idx| idx = HEX_RANGE.sample}
  uuid_hex = uuid_ary.map do |section|
    section.map do |num|
      num.to_s(16)
    end
  end
  uuid_hex.map(&:join).join('-')
end


p uuid
