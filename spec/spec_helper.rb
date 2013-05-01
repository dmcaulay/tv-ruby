
module AsyncCall
  def done()
    EM.stop
  end
end

RSpec.configure do |config|
  config.include AsyncCall
  config.around(:each) do |example|
    if example.metadata[:async]
      EM.run do
        example.run
      end
    else
      example.run
    end
  end
end
