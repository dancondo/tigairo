### Destruction

Post.destroy_all
Category.destroy_all
# User.destroy_all
# Country.destroy_all

### Construction

categories = %w[食べ物・飲み物 人との接し方 恋愛 お祝い ファッション お店 家 街 時間 仕事 勉強 その他]
categories.each do |category|
  next unless Category.where(name: category) == []
  Category.create!(name: category)
end

# Country.all[4..-1].each do |c|
#   c.destroy
# end

countries = %w[アイスランド アイランド アメリカ アルゼンチン イギリス イタリア インド インドネシア エジプト エチオピア オーストラリア オーストリア オランダ ガーナ カナダ 韓国 カンボジア キューバ スイス スウェーデン サウジアラビア シリア シンガポール スペイン スリランカ タイ 中国 チリ デンマーク ドイツ ナイジェリア ニュージーランド ネパール ノルウェー ハンガリー バングラデシュ フィジー フィリピン フィンランド ブータン ブラジル フランス ベトナム ペルー ベルギー ボリビア ポルトガル マレーシア 南アフリカ共和国 ミャンマー メキシコ モロッコ ラオス ルーマニア ロシア その他]
countries.each do |country|
  next unless Country.where(name: country) == []
  Country.create!(name: country, photo_path: "flags/#{country}.png")
end

reaction_tags = %w[いいね おもしろい びっくり かなしい あるある]
reaction_tags.each do |reaction_tag|
  next unless ReactionTag.where(name: reaction_tag) == []
  ReactionTag.create!(name: reaction_tag, photo_path: "reaction_tags_photos/#{reaction_tag}.png")
end
