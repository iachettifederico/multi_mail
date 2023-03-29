# expect(something).to boolean_count(2, :items)
# expect(something).to boolean_count(0, :items)
RSpec::Matchers.define :boolean_count do |expected_count, attribute_name|
  match do |object|
    actual_count = object.public_send("#{attribute_name}_count")
    actual_count_p = object.public_send("#{attribute_name}?")

    should_be_zero = !expected_count.zero?

    expected_count == actual_count && actual_count_p == should_be_zero
  end
end
