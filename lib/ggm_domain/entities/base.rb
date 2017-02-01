module GgmDomain
  module Entities
    class Base
      require 'virtus'
      require 'active_model'
      require 'active_support'
      include Virtus.model
      include ActiveModel::Model
    end
  end
end