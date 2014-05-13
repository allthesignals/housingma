object @profile

# child :muni do
#   attributes :name, :muni_id
#   node :fields do |p|
    # node :value do |p|
    #   p.send (@profile.fields.first)
    # end
#   end
# end

# child :neighbors do
#   node(:names)    { |n| n.municipalities.map {|m| m.name} }
#   node(:muni_ids) { |n| n.municipalities.map {|m| m.muni_id} }
#   child :fields do
#     attributes :alias, :title
#   end

  # collection @profile.fields, root: "fields", object_root: false
  # extends('municipalities/field', locals: { geography: @profile.community_type })

  # @profile.fields.each do |f|
  #   node(:title) { f.title }
  #   node(:alias) { f.alias }
  #   node(:value) do |neighbors|
  #     neighbors.send (@profile.fields.first.with_op)
  #   end
  # end

# end
# child @profile.muni => :municipality do
#   attribute :name
#   @profile.fields.each do |f|
#     node(f) { @profile.muni.housing_data.send(f.title) }
#   end
# end

# child @profile.neighbors => :neighbors do
#   node(:names) { @profile.neighbors.municipalities.map {|n| n.name} }

#   @profile.fields.each do |f|
#     node(f) { @profile.neighbors.send(f.with_op) }
#     # node("#{f.operation}_#{f.title}") { @profile.neighbors.send(f.with_op) }
#   end
# end

# child @profile.community_type => :community_type do
#   attribute :name
#   :fields => partial("municipalities/field",
#                      :object => @profile.
#                      locals: { geography: @profile.community_type } )
# end

# child @profile.region => :region do
#   attribute :name
#   @profile.fields.each do |f|
#     node(f) { @profile.region.send(f.with_op) }
#   end
# end

# child @profile.county => :county do
#   attribute :name
#   attribute :fips
#   @profile.fields.each do |f|
#     node(f) { @profile.county.send(f.with_op) }
#   end
# end

# child @profile.state => :state do
#   attribute :name
#   attribute :fips
#   @profile.fields.each do |f|
#     node(f) { @profile.state.send(f.with_op) }
#   end
# end
