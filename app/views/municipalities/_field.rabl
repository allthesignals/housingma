attribute :title
attribute :alias

node(:value) do |field|
  locals[:geography].send(field.with_op)
end