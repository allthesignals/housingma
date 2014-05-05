class Profile < CommonFacade

  def neighboring
    neighbors.municipalities.sort_by {|m| m.name}
  end

  def similar_munis
    community_type.municipalities
  end
end