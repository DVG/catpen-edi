class Hello < EDI::Service
  phrases "hi", "hello", "good morning", "good afternoon", "good evening"
  # See https://github.com/DVG/edi for information on creating services
  def run
    [
      "Hi There!",
      "Hello"
    ].sample
  end
end
