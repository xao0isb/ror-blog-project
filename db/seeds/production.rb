# frozen_string_literal: true

module Seeder
  module Production
    def self.run
      Category.create name: 'Общее'
      Category.create name: 'Мемы'
      Category.create name: 'Новости'
    end
  end
end
