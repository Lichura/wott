class HardWorker
  include Sidekiq::Worker

  def perform(*args)
        Product.vuelos
    puts("vuelos probando el job")
  end
end
