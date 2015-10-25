require "capybara/fill_many/version"

module Capybara
  module FillMany

    # Possible usages:
    # fill_many(prefix: 'customer', with: hash)
    # fill_many(prefix: 'customer', with: active_record)
    # fill_many(with: active_record)
    def fill_many(*args)
      # parameter: active_record 
      if args.size == 1
        options = args.first

      # parameter: prefix, options
      else
        options = args.second
        options.merge!(prefix: args.first) 
        if options[:prefix].respond_to? :model_name 
          options[:prefix] = options[:prefix].model_name.param_key 
        end
      end

      # fail on missing data
      return if !options[:with]

      # maybe convert active_record data to hash 
      if options[:with].is_a? ActiveRecord::Base
        options[:with] = options[:with].attributes 
      end

      # maybe derive prefix from active_record
      options[:prefix] ||= options[:with].class.model_name.param_key

      # fill fields
      options[:with].each do |key, value|
        find(:fillable_field, "#{options[:prefix]}_#{key}", {}).try(:set, value) rescue Capybara::ElementNotFound
      end
    end

    alias :fill_in_many :fill_many

  end
end
