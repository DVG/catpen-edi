class PoliteService < EDI::Service
  phrases "thanks", "thank you"
  def run
    "It was my pleasure"
  end
end
