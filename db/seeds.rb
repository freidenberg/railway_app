# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
LinesTag.create([
  { image:File.open("./public/JRmarks/y.jpg"), name: '予讃線(高松-松山)' },
  { image:File.open("./public/JRmarks/u.jpg"), name: '予讃線,内子線(松山-宇和島)' },
  { image:File.open("./public/JRmarks/s.jpg"), name: '予讃線(愛ある伊予灘線,向井原-伊予大洲)' },
  { image:File.open("./public/JRmarks/d.jpg"), name: '土讃線(多度津-高知)' },
  { image:File.open("./public/JRmarks/k.jpg"), name: '土讃線(高知-窪川)' },
  { image:File.open("./public/JRmarks/m.jpg"), name: '牟岐線(阿波室戸シーサイドライン)' },
  { image:File.open("./public/JRmarks/b.jpg"), name: '徳島線(よしの川ブルーライン)' },
  { image:File.open("./public/JRmarks/n.jpg"), name: '鳴門線' },
  { image:File.open("./public/JRmarks/g.jpg"), name: '予土線(しまんとグリーンライン)' },
  { image:File.open("./public/JRmarks/t.jpg"), name: '高徳線' },
  { image:File.open("./public/JRmarks/st.jpg"), name: '瀬戸大橋線' }
])


