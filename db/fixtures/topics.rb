module Fixtures
  def topics
   [{id: 1, title: 'Demographics'},
    {id: 2, title: 'Supply'},
    {id: 3, title: 'Affordability'}]
  end

  def subtopics
   [{id: 1, title: 'Population',  topic_id: 1},
    {id: 2, title: 'Households',  topic_id: 1},
    {id: 3, title: 'Projections', topic_id: 1}]
  end
end