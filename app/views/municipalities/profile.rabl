object false

child @profile.muni => :municipality do
  attribute :name
  @profile.fields.each do |f|
    node(f) { @profile.muni.housing_data.send(f.title) }
  end
end

child @profile.neighbors => :neighbors do
  node(:names) { @profile.neighbors.municipalities.map {|n| n.name} }

  @profile.fields.each do |f|
    node(f) { @profile.neighbors.send(f.with_op) }
  end
end

child @profile.community_type => :community_type do
  attribute :name
  @profile.fields.each do |f|
    node(f) { @profile.community_type.send(f.with_op) }
  end
end

child @profile.region => :region do
  attribute :name
  @profile.fields.each do |f|
    node(f) { @profile.region.send(f.with_op) }
  end
end

child @profile.county => :county do
  attribute :name
  attribute :fips
  @profile.fields.each do |f|
    node(f) { @profile.county.send(f.with_op) }
  end
end

child @profile.state => :state do
  attribute :name
  attribute :fips
  @profile.fields.each do |f|
    node(f) { @profile.state.send(f.with_op) }
  end
end