require "./big_five_results_text_serializer"
require "./big_five_results_poster"

file = File.open("report.txt", "rb")
content = file.read

serializer = BigFiveResultsTextSerializer.new(content)

report = serializer.to_hash

poster = BigFiveResultsPoster.new(report)

result = poster.post

if result
  puts poster.token
end
