module HousingIndicators
  # Enables access to common housing indicators
  # by precalculating indicators from housing data attributes.

  # Included in app/models/housing_data

  # TODO: Catch NoMethodErrors for all methods by returning `nil`

  YEARS = 10

  def working_age_adults_20_65
    (pop10_2034 + pop10_3564)
  end


  def househld_30_60_2010
    (hh10_3044 + hh10_4559)
  end

  def househld_30_60_2030
    (hh30_3044 + hh30_4559)
  end

  def househld_60_pl_2010
    (hh10_6074 + hh10_75pl)
  end

  def househld_60_pl_2030
    (hh30_6074 + hh30_75pl)
  end


  def under_60_househld_2030
    (hh30_4559 + hh30_3044 + hh30_1529)
  end

  def under_60_househld_2010
    (hh10_4559 + hh10_3044 + hh10_1529)
  end

  def sf_homes_over_55_2020
    (sfo5574_20 + sfr5574_20 + sfo75p_20 + sfr75p_20)
  end

  def sf_homes_under_55_2020
    (sfo1534_20 + sfr1534_20 + sfo3554_20 + sfr3554_20)
  end

  def mf_homes_over_55_2020
    (mfo5574_20 + mfr5574_20 + mfo75p_20 + mfr75p_20)
  end

  def mf_homes_under_55_2020
    (mfo1534_20 + mfr1534_20 + mfo3554_20 + mfr3554_20)
  end

  def occupied_units
    (ownoccv2 + r_occv2)
  end

  def cost_burdened_units
    (o_cb + r_cb)
  end

  def sev_cost_burdened_units
    (o_cb50 + r_cb50)
  end


  def net_housing_demand_2020
    (hu1534_20 + hu3554_20 + hu5574_20 + hu75p_20)
  end

  def net_housing_demand_2020_ann
    (net_housing_demand_2020 / YEARS)
  end

  def net_housing_demand_55_pl_2020
    (hu5574_20 + hu75p_20)
  end

  def sf_demand_2020
    (sf_homes_under_55_2020 + sf_homes_over_55_2020)
  end

  def mf_demand_2020
    (mf_homes_under_55_2020 + mf_homes_over_55_2020)
  end

  def sf_demand_2020_ann
    (sf_demand_2020 / YEARS)
  end

  def mf_demand_2020_ann
    (mf_demand_2020 / YEARS)
  end

  def net_demand_sf_2020
    (sfr1534_20 + sfo1534_20 + sfr3554_20 + sfo3554_20 + sfr5574_20 + sfo5574_20 + sfr75p_20 + sfo75p_20)
  end

  def net_demand_mf_2020
    (mfr1534_20 + mfo1534_20 + mfr3554_20 + mfo3554_20 + mfr5574_20 + mfo5574_20 + mfr75p_20 + mfo75p_20)
  end

  def putting_back_sf
    ((sfr5574_20 + sfo5574_20 + sfr75p_20 + sfo75p_20) / 10).abs
  end

end