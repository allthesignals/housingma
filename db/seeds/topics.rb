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
    [{title: 'ro',       subtopic_id: 1, alias: "Renter-Occupied Units (ROUs)"},
     {title: 'roa5',     subtopic_id: 1, alias: "ROUs Affordable to Households With Incomes Below 50% AMI"},
     {title: 'roa58',    subtopic_id: 1, alias: "ROUs Affordable to Households With Incomes Between 50-80% AMI"},
     {title: 'roa8',     subtopic_id: 1, alias: "ROUs Affordable to Households With Incomes Above 80% AMI"},
     {title: 'oo',       subtopic_id: 2, alias: "Owner-Occupied Units (OOUs)"},
     {title: 'ooa5',     subtopic_id: 2, alias: "OOUs Affordable to Households With Incomes Below 50% AMI"},
     {title: 'ooa58',    subtopic_id: 2, alias: "OOUs Affordable to Households With Incomes Between 50-80% AMI"},
     {title: 'ooa8',     subtopic_id: 3, alias: "OOUs Affordable to Households With Incomes Above 80% AMI"},
     {title: 'o',        subtopic_id: 3, alias: "Occupied Units (OUs)"},
     {title: 'oa5',      subtopic_id: 3, alias: "OUs Affordable to Households With Incomes Below 50% AMI"},
     {title: 'oa58',     subtopic_id: 4, alias: "OUs Affordable to Households With Incomes Between 50-80% AMI"},
     {title: 'oa8',      subtopic_id: 4, alias: "OUs Affordable to Households With Incomes Above 80% AMI"},
     {title: 'ro_50',    subtopic_id: 4, alias: "Renter-Occupied Housing Units with Incomes Below 50% AMI"},
     {title: 'ro_50_80', subtopic_id: 4, alias: "Renter-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {title: 'ro_80',    subtopic_id: 4, alias: "Renter-Occupied Housing Units with Incomes Above 80% AMI"},
     {title: 'oo_50',    subtopic_id: 5, alias: "Owner-Occupied Housing Units with Incomes Below 50% AMI"},
     {title: 'oo_50_80', subtopic_id: 5, alias: "Owner-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {title: 'oo_80',    subtopic_id: 6, alias: "Owner-Occupied Housing Units with Incomes Above 80% AMI"},
     {title: 'o_50',     subtopic_id: 7, alias: "Occupied Housing Units with Incomes Below 50% AMI"},
     {title: 'o_50_80',  subtopic_id: 7, alias: "Occupied Housing Units with Incomes Between 50-80% AMI"},
     {title: 'o_80',     subtopic_id: 8, alias: "Occupied Housing Units with Incomes Above 80% AMI"},
     {title: 'ag_5',     subtopic_id: 8, alias: "Affordability Gap: Occupied Housing Units with Incomes Below 50% AMI"},
     {title: 'ag_58',    subtopic_id: 8, alias: "Affordability Gap: Occupied Housing Units with Incomes Between 50-80% AMI"},
     {title: 'ag_8',     subtopic_id: 9, alias: "Affordability Gap: Occupied Housing Units with Incomes Above 80% AMI"},
     {title: 'ag_oo5',   subtopic_id: 9, alias: "Affordability Gap: Owner-Occupied Housing Units with Incomes Below 50% AMI"},
     {title: 'ag_oo58',  subtopic_id: 9, alias: "Affordability Gap: Owner-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {title: 'ag_oo8',   subtopic_id: 9, alias: "Affordability Gap: Owner-Occupied Housing Units with Incomes Above 80% AMI"},
     {title: 'ag_ro5',   subtopic_id: 9, alias: "Affordability Gap: Renter-Occupied Housing Units with Incomes Below 50% AMI"},
     {title: 'ag_ro58',  subtopic_id: 10, alias: "Affordability Gap: Renter-Occupied Housing Units with Incomes Between 50-80% AMI"},
     {title: 'ag_ro8',   subtopic_id: 10, alias: "Affordability Gap: Renter-Occupied Housing Units with Incomes Above 80% AMI"}]
  end
end