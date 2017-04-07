class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'has invalid format') unless value =~ EMAIL_REGEXP
  end
end
