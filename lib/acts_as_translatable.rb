require "rubygems"

require "acts_as_translatable/base"

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsTranslatable::Base
end
