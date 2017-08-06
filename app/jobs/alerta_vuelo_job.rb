class AlertaVueloJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Product.vuelos
    puts("vuelos probando el job")
  end
end
