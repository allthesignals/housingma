# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

module Seeds
  def topic_areas
   [{id: 1, title: 'Demographics'},
    {id: 2, title: 'Supply'},
    {id: 3, title: 'Affordability'}]
  end

  def topics
   [{id: 1, title: 'Population',  topic_area_id: 1},
    {id: 2, title: 'Households',  topic_area_id: 1},
    {id: 3, title: 'Projections', topic_area_id: 1},
    {id: 4, title: 'Stock',       topic_area_id: 2},
    {id: 5, title: 'Tenure',      topic_area_id: 2},
    {id: 6, title: 'Cost Burden', topic_area_id: 3},
    {id: 7, title: 'SHI',         topic_area_id: 3}]
  end

  def subtopics
   [{id: 1,  title: 'Age',                   topic_id: 2},
    {id: 2,  title: 'Type',                  topic_id: 2},
    {id: 3,  title: 'Size',                  topic_id: 2},
    {id: 4,  title: 'Age',                   topic_id: 4},
    {id: 5,  title: 'Type',                  topic_id: 4},
    {id: 6,  title: 'Tenure',                topic_id: 6},
    {id: 7,  title: 'Household Composition', topic_id: 6},
    {id: 8,  title: 'Income',                topic_id: 6},
    {id: 9,  title: 'Subsidized',            topic_id: 7},
    {id: 10, title: 'Expiring Use',          topic_id: 7}]
  end

  def fields
    [{id: 1,  title: 'ro',       subtopic_id: 1,  alias: "Renter-Occupied Units (ROUs)"},
     {id: 2,  title: 'roa5',     subtopic_id: 1,  alias: "ROUs Affordable to Households With Incomes Below 50% AMI"},
     {id: 3,  title: 'roa58',    subtopic_id: 1,  alias: "ROUs Affordable to Households With Incomes Between 50-80% AMI"},
     {id: 4,  title: 'roa8',     subtopic_id: 1,  alias: "ROUs Affordable to Households With Incomes Above 80% AMI"},
     {id: 5,  title: 'oo',       subtopic_id: 2,  alias: "Owner-Occupied Units (OOUs)"},
     {id: 6,  title: 'ooa5',     subtopic_id: 2,  alias: "OOUs Affordable to Households With Incomes Below 50% AMI"},
     {id: 7,  title: 'ooa58',    subtopic_id: 2,  alias: "OOUs Affordable to Households With Incomes Between 50-80% AMI"},
     {id: 8,  title: 'ooa8',     subtopic_id: 3,  alias: "OOUs Affordable to Households With Incomes Above 80% AMI"},
     {id: 9,  title: 'o',        subtopic_id: 3,  alias: "Occupied Units (OUs)"},
     {id: 10, title: 'oa5',      subtopic_id: 3,  alias: "OUs Affordable to Households With Incomes Below 50% AMI"},
     {id: 11, title: 'oa58',     subtopic_id: 4,  alias: "OUs Affordable to Households With Incomes Between 50-80% AMI"},
     {id: 12, title: 'oa8',      subtopic_id: 4,  alias: "OUs Affordable to Households With Incomes Above 80% AMI"},
     {id: 13, title: 'ro_50',    subtopic_id: 4,  alias: "Renter-Occupied Housing Units with Incomes Below 50% AMI"},
     {id: 14, title: 'ro_50_80', subtopic_id: 4,  alias: "Renter-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {id: 15, title: 'ro_80',    subtopic_id: 4,  alias: "Renter-Occupied Housing Units with Incomes Above 80% AMI"},
     {id: 16, title: 'oo_50',    subtopic_id: 5,  alias: "Owner-Occupied Housing Units with Incomes Below 50% AMI"},
     {id: 17, title: 'oo_50_80', subtopic_id: 5,  alias: "Owner-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {id: 18, title: 'oo_80',    subtopic_id: 6,  alias: "Owner-Occupied Housing Units with Incomes Above 80% AMI"},
     {id: 19, title: 'o_50',     subtopic_id: 7,  alias: "Occupied Housing Units with Incomes Below 50% AMI"},
     {id: 20, title: 'o_50_80',  subtopic_id: 7,  alias: "Occupied Housing Units with Incomes Between 50-80% AMI"},
     {id: 21, title: 'o_80',     subtopic_id: 8,  alias: "Occupied Housing Units with Incomes Above 80% AMI"},
     {id: 22, title: 'ag_5',     subtopic_id: 8,  alias: "Affordability Gap: Occupied Housing Units with Incomes Below 50% AMI"},
     {id: 23, title: 'ag_58',    subtopic_id: 8,  alias: "Affordability Gap: Occupied Housing Units with Incomes Between 50-80% AMI"},
     {id: 24, title: 'ag_8',     subtopic_id: 9,  alias: "Affordability Gap: Occupied Housing Units with Incomes Above 80% AMI"},
     {id: 25, title: 'ag_oo5',   subtopic_id: 9,  alias: "Affordability Gap: Owner-Occupied Housing Units with Incomes Below 50% AMI"},
     {id: 26, title: 'ag_oo58',  subtopic_id: 9,  alias: "Affordability Gap: Owner-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {id: 27, title: 'ag_oo8',   subtopic_id: 9,  alias: "Affordability Gap: Owner-Occupied Housing Units with Incomes Above 80% AMI"},
     {id: 28, title: 'ag_ro5',   subtopic_id: 9,  alias: "Affordability Gap: Renter-Occupied Housing Units with Incomes Below 50% AMI"},
     {id: 29, title: 'ag_ro58',  subtopic_id: 10, alias: "Affordability Gap: Renter-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {id: 30, title: 'ag_ro8',   subtopic_id: 10, alias: "Affordability Gap: Renter-Occupied Housing Units with Incomes Above 80% AMI"}]
  end

  module_function :topic_areas
  module_function :topics
  module_function :subtopics
  module_function :fields
end


def print_and_flush(str)
  print str
  $stdout.flush
end



model_names = %w( TopicArea Topic Subtopic Field )

model_names.each do |model_name|
  print_and_flush "seeding #{model_name}"

  model   = Module.const_get model_name
  records = eval "Seeds::#{model.table_name}"

  records.each do |record|
    rec = model.create_or_update(record, without_protection: true)
  end

  puts " -- DONE!"
end














