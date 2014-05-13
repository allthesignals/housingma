module StaticPagesHelper
  def random_muni
    Municipality.first(offset: rand(Municipality.count)).name
  end
end
