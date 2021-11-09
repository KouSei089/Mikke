require 'google/cloud/language' # APIを使う

language = Google::Cloud::Language.language_service
document = { type: :PLAIN_TEXT, content: '今日も1日楽しかった。' }
response = language.analyze_sentiment document: document

sentiment = response.document_sentiment

score = sentiment.score.to_f.round(1) # float型に変換,少数第2位を四捨五入
magnitude = sentiment.magnitude.to_f.round(1)
puts "Score: #{score}"
puts "Magnitude: #{magnitude}"
