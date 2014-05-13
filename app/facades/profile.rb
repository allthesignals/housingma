require 'csv'

class Profile < CommonFacade

  # Include Field association
  def initialize(municipality)
    @topic_areas = TopicArea.includes(:fields).all
    super
  end

  def fields
    Field.all
  end

  def neighboring
    neighbors.municipalities.sort_by {|m| m.name}
  end

  def similar_munis
    community_type.municipalities
  end


  # TODO: Refactor this and possibly move it into a module.
  def to_csv
    CSV.generate do |csv|
      csv << ["Housing Data Profile: #{self.muni}",
               nil,
               nil,
               nil,
               "Generated on:",
               DateTime.now.strftime("%d %b %Y"),
              "Housing MA",
              "http://housing.ma"]

      csv << nil_row(nil)

      csv << ["Attribute",
              "#{self.muni}",
              "#{self.muni}, Margin of Error",
              "Aggregation Method",
              "#{self.neighbors} Municipalities",
              "#{self.community_type} (Community Type)",
              "#{self.region} (Region)",
              "#{self.county} (County)",
              "#{self.state} (State)"]
      
      self.topic_areas.each do |area|
        csv << nil_row("#{area}")

        area.topics.each do |topic|
          csv << nil_row("\t#{topic}")

          topic.subtopics.each do |subtopic|
            csv << nil_row("\t\t#{subtopic}")

            subtopic.fields.each do |field|
              csv << ["\t\t\t#{field.alias}",
                      self.housing.send(field.to_s),
                      self.housing.send(field.to_s << "_me"),
                      field.operation,
                      self.neighbors.send(field.with_op),
                      self.community_type.send(field.with_op),
                      self.region.send(field.with_op),
                      self.county.send(field.with_op),
                      self.state.send(field.with_op)]

            end
          end
        end
      end
    end
  end

  private

    def nil_row(text)
      [text,nil,nil,nil,nil,nil,nil]
    end

end
