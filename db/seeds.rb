### Destruction

# Post.destroy_all
# User.destroy_all
# Country.destroy_all

### Construction

categories = %w[ごはん 友達との接し方 お店の人 ファッション お祝い 時間 街 仕事 恋愛 その他]
categories.each do |category|
  next unless Category.where(name: category) == []
  Category.create!(name: category)
end
countries = %w[アメリカ ブラジル カナダ イギリス オーストラリア]
countries.each do |country|
  next unless Country.where(name: country) == []
  Country.create!(name: country, photo_path: "flags/#{country}.png")
end

reaction_tags = %w[いいね おもしろい びっくり かなしい あるある]
reaction_tags.each do |reaction_tag|
  next unless ReactionTag.where(name: reaction_tag) == []
  ReactionTag.create!(name: reaction_tag, photo_path: "reaction_tags_photos/#{reaction_tag}.png")
end
