# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@businesses = {1 => {:categories => [84, 1103]}, 2 => {:categories => [84, 1103]}, 3 => {:categories => [84, 1103]}, 4 => {:categories => [758]}}
@categories = {
  84 => {:sub_categories => [85,86,87,88,89,91,92,93,94,95,96,97,98,99,616,617,622,623,624,1061]}, 
  758 => {:sub_categories => []}, 
  1103 => {:sub_categories => []}}
@valid_category_ids_lma = [84, 1103]
#@valid_sub_category_ids_from_lma = [66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 603, 604, 85, 86, 87, 88, 89, 91, 92, 93, 94, 95, 96, 97, 98, 99, 616, 617, 622, 623]
@valid_sub_category_ids_from_lma = [85, 86, 87, 88, 89, 91, 92, 93, 94, 95, 96, 97, 98, 99, 616, 617, 622, 623, 624, 1061];
@valid_image_ids_from_lma = [55101, 55124, 55145, 55234, 55237, 55238, 55240, 55241, 55242, 55243, 55245, 55246, 55247, 55249, 55250, 55250, 55253, 55254, 55256, 55258, 55259, 55261, 55262]

@valid_business_ids_from_lma = [1, 2, 3, 4]

@target_customers = [
  {gender: 'female', min_age: 12, max_age: 17, text: 'Female 12-17'},
  {gender: 'female', min_age: 18, max_age: 24, text: 'Female 18-24'},
  {gender: 'female', min_age: 25, max_age: 34, text: 'Female 25-34'},
  {gender: 'female', min_age: 35, max_age: 44, text: 'Female 35-44'},
  {gender: 'female', min_age: 45, max_age: 54, text: 'Female 45-54'},
  {gender: 'female', min_age: 55, max_age: 64, text: 'Female 55-64'},
  {gender: 'female', min_age: 65, max_age: 200, text: 'Female 64+'},
  {gender: 'male', min_age: 12, max_age: 17, text: 'Male 12-17'},
  {gender: 'male', min_age: 18, max_age: 24, text: 'Male 18-24'},
  {gender: 'male', min_age: 25, max_age: 34, text: 'Male 25-34'},
  {gender: 'male', min_age: 35, max_age: 44, text: 'Male 35-44'},
  {gender: 'male', min_age: 45, max_age: 54, text: 'Male 45-54'},
  {gender: 'male', min_age: 55, max_age: 64, text: 'Male 55-64'},
  {gender: 'male', min_age: 65, max_age: 200, text: 'Male 64+'},
]

def create_target_customers
  puts 'Creating target customers'
  @target_customers.each do |tc| 
    unless TargetCustomer.find_by min_age: tc[:min_age], gender: tc[:gender]
      c= TargetCustomer.create!(
        gender: tc[:gender],
        min_age: tc[:min_age],
        max_age: tc[:max_age],
        text: tc[:text]
      )
      puts c.errors.full_messages if c.errors.any?
    end
  end
end

def create_product_types
  puts 'Creating product types'
  unless ProductType.count >= 200
    100.times do |i|
      pt = ProductType.new(
        name: Faker::Commerce.product_name.split()[-1], 
        status: ProductType.statuses.keys.sample
      )
      pt.save
      puts pt.errors.full_messages if pt.errors.any?
    end
  end
end

def create_products
  puts 'Creating products'
  unless(Product.count >= 200)
    30.times do |i|
      product_type = ProductType.all.sample
      product_title = Faker::Commerce.product_name
      p = Product.new(
        category_id: @valid_sub_category_ids_from_lma.sample,
        business_id: @valid_business_ids_from_lma.sample,
        title: product_title,
        description: Faker::Lorem.paragraph,
        status: Product.statuses.keys.sample,
        show_discount: [true, false].sample,
        gifting_enabled: [true, false].sample,
        sharing_enabled: [true, false].sample,
        mobile_call_enabled: [true, false].sample,
        product_type: product_type,
      )

      @valid_image_ids_from_lma.sample(rand 1..20).each do |image_id|
        p.images_products.build(
          image_id: image_id,
          is_default: false,
        )
      end
      ip = p.images_products.sample
      ip.is_default = true

      Faker::StarWars.quotes.sample(rand 1..10).each do |sentence|
        p.fine_prints.build text: sentence
      end

      p.target_customers << TargetCustomer.all.sample(rand 1..14)

      (1..5).to_a.sample.times do |i|
        price = Faker::Commerce.price
        p.purchase_options.build(
          name: product_title + ' ' + Faker::Commerce.color,
          redemption_qty: rand(1..5),
          min_price: price,
          retail_price: (price + rand * price).round(2),
          max_per_person: rand(1..5),
          quantity_available: rand(1..5),
          sku: Faker::Commerce.promotion_code,
        )
      end

      p.save
      puts p.errors.full_messages if p.errors.any?
    end
  end
end

def create_tag_categories_and_tags
  puts 'Creating tags'
  100.times do |i|
    name = Faker::Commerce.department(1)
    unless TagCategory.find_by name: name
      tc = TagCategory.create(name: name)
      rand(5..20).times do |i|
        tag_name = Faker::Food.dish
        tc.tags.build(name: tag_name) unless tc.tags.find_by(name: tag_name)
      end
      tc.save
      puts tc.errors.full_messages if tc.errors.any?
    end
  end
end

def relate_tags_to_images
  puts 'Relating tags to images'
  @valid_image_ids_from_lma.each do |image_id|
    Tag.all.sample(rand 0..10).each do |tag|
      t = tag.images_tags.build(image_id: image_id)
      t.save
      puts t.errors.full_messages if t.errors.any?
    end
  end
end

create_product_types
create_target_customers
create_products
create_tag_categories_and_tags
relate_tags_to_images


#if ENV["ACTIVATE_ALL_PRODUCTS"]
#  Product.update_all(status:'active')
#  puts "Activated All Products"
#end

#if ENV["ADD_PRODUCT_TYPES"]
#  product_types = ["helmet","bag","cat","remote","plate","book","couch","photo album","conditioner","credit card","clamp","desk","face wash","television","glasses","shoes","sofa","rubber band","pencil","newspaper","paint brush","perfume","ipod","mop","thread"]
#  product_types.each_with_index do |product,index|
#    ProductType.create!(name:product,category_id:index)
#    puts "Created #{product}"
#  end
#end

#if ENV["ADD_TAGS"]
#  tags = ["pencil","stop sign","lip gloss","tooth picks","box","pen","pool stick","shawl","window","hair tie","lamp","food","table","monitor","plastic fork","bed","money","thread","air freshener","outlet","mop","chapter book","doll","shampoo","carrots"]
#  tags.each do |tag|
#    Tag.create!(tag_category_id:1, name: tag)
#    puts "Created #{tag}"
#  end
#end

