# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if ENV["ACTIVATE_ALL_PRODUCTS"]
  Product.update_all(status:'active')
  puts "Activated All Products"
end

if ENV["ADD_PRODUCT_TYPES"]
  product_types = ["helmet","bag","cat","remote","plate","book","couch","photo album","conditioner","credit card","clamp","desk","face wash","television","glasses","shoes","sofa","rubber band","pencil","newspaper","paint brush","perfume","ipod","mop","thread"]
  product_types.each_with_index do |product,index|
    ProductType.create!(name:product,category_id:index)
    puts "Created #{product}"
  end
end

if ENV["ADD_TAGS"]
  tags = ["pencil","stop sign","lip gloss","tooth picks","box","pen","pool stick","shawl","window","hair tie","lamp","food","table","monitor","plastic fork","bed","money","thread","air freshener","outlet","mop","chapter book","doll","shampoo","carrots"]
  tags.each do |tag|
    Tag.create!(tag_category_id:1, name: tag)
    puts "Created #{tag}"
  end
end
