class MessageParser
  def initialize(handler)
    @handler = handler

    @buffer = "".force_encoding('BINARY')
    @state = :length
    @bytes_remaining = 4
  end

  def consume(data)
    data.force_encoding('BINARY')
    while data.length > 0
      length = (data.length > @bytes_remaining ? @bytes_remaining : data.length)
      @buffer += data[0...length]
      @bytes_remaining -= length
      data = data[length..-1]

      if @bytes_remaining == 0
        if :length == @state
          @state = :data
          @bytes_remaining = @buffer.unpack('N').first
          if @bytes_remaining == 0
            @state = :length
            @bytes_remaining = 4
          end
        elsif :data == @state
          @state = :length
          @bytes_remaining = 4

          @handler.dispatch_msg @buffer
        end
        @buffer = "".force_encoding('BINARY')
      end
    end
  end
end
