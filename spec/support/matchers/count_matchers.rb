# expect(something).to boolean_count(2, :items)
# expect(something).to boolean_count(0, :items)
RSpec::Matchers.define :boolean_count do |expected_count, attribute_name|
  count_method_name = "#{attribute_name}_count"
  count_predicate_method_name = "#{attribute_name}?"
  should_be_zero = !expected_count.zero?

  match do |object|
    actual_count = object.public_send(count_method_name)
    actual_count_p = object.public_send(count_predicate_method_name)

    expected_count == actual_count && actual_count_p == should_be_zero
  end

  failure_message do |object|
    actual_count = object.public_send(count_method_name)
    actual_count_p = object.public_send(count_predicate_method_name)

    <<~ERROR
      Expected #{count_method_name} to be #{expected_count}, but was #{actual_count}.
      Expected #{count_predicate_method_name} to be #{should_be_zero}, but was #{actual_count_p}.
    ERROR
  end

  failure_message_when_negated do |object|
    actual_count = object.public_send(count_method_name)
    actual_count_p = object.public_send(count_predicate_method_name)

    <<~ERROR
      Expected #{count_method_name} not to be #{expected_count}, but was #{actual_count}.
      Expected #{count_predicate_method_name} not to be #{should_be_zero}, but was #{actual_count_p}.
    ERROR
  end
end
