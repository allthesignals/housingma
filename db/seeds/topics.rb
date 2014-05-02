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
    {id: 10, title: 'EUR',                   topic_id: 7}]
  end

  def fields
    [{name: 'ro',       subtopic_id: 1,  alias: "Renter-Occupied Units (ROUs)"},
     {name: 'roa5',     subtopic_id: 1,  alias: "ROUs Affordable to Households With Incomes Below 50% AMI"},
     {name: 'roa58',    subtopic_id: 1,  alias: "ROUs Affordable to Households With Incomes Between 50-80% AMI"},
     {name: 'roa8',     subtopic_id: 2,  alias: "ROUs Affordable to Households With Incomes Above 80% AMI"},
     {name: 'oo',       subtopic_id: 2,  alias: "Owner-Occupied Units (OOUs)"},
     {name: 'ooa5',     subtopic_id: 3,  alias: "OOUs Affordable to Households With Incomes Below 50% AMI"},
     {name: 'ooa58',    subtopic_id: 3,  alias: "OOUs Affordable to Households With Incomes Between 50-80% AMI"},
     {name: 'ooa8',     subtopic_id: 3,  alias: "OOUs Affordable to Households With Incomes Above 80% AMI"},
     {name: 'o',        subtopic_id: 4,  alias: "Occupied Units (OUs)"},
     {name: 'oa5',      subtopic_id: 4,  alias: "OUs Affordable to Households With Incomes Below 50% AMI"},
     {name: 'oa58',     subtopic_id: 5,  alias: "OUs Affordable to Households With Incomes Between 50-80% AMI"},
     {name: 'oa8',      subtopic_id: 5,  alias: "OUs Affordable to Households With Incomes Above 80% AMI"},
     {name: 'ro_me',    subtopic_id: 5,  alias: "Margin of Error: Renter-Occupied Units (ROUs)"},
     {name: 'roa5_me',  subtopic_id: 6,  alias: "Margin of Error: ROUs Affordable to Households With Incomes Below 50% AMI"},
     {name: 'roa58_me', subtopic_id: 7,  alias: "Margin of Error: ROUs Affordable to Households With Incomes Between 50-80% AMI"},
     {name: 'roa8_me',  subtopic_id: 8,  alias: "Margin of Error: ROUs Affordable to Households With Incomes Above 80% AMI"},
     {name: 'oo_me',    subtopic_id: 8,  alias: "Margin of Error: Owner-Occupied Units (OOUs)"},
     {name: 'ooa5_me',  subtopic_id: 9,  alias: "Margin of Error: OOUs Affordable to Households With Incomes Below 50% AMI"},
     {name: 'ooa58_me', subtopic_id: 9,  alias: "Margin of Error: OOUs Affordable to Households With Incomes Between 50-80% AMI"},
     {name: 'ooa8_me',  subtopic_id: 9,  alias: "Margin of Error: OOUs Affordable to Households With Incomes Above 80% AMI"},
     {name: 'o_me',     subtopic_id: 9,  alias: "Margin of Error: Occupied Units (OUs)"},
     {name: 'oa5_me',   subtopic_id: 9,  alias: "Margin of Error: OUs Affordable to Households With Incomes Below 50% AMI"},
     {name: 'oa58_me',  subtopic_id: 10, alias: "Margin of Error: OUs Affordable to Households With Incomes Between 50-80% AMI"},
     {name: 'oa8_me',   subtopic_id: 10, alias: "Margin of Error: OUs Affordable to Households With Incomes Above 80% AMI"}]
  end
end



