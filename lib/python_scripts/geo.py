import geocoder
def run():
  g = geocoder.google('New York City')
  print g
  print g.state
  print g.json
run()
