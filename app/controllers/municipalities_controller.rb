class MunicipalitiesController < ApplicationController

  def show
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

  def report
    @report = Report.new( Municipality.find_by_name(params[:id].titleize) )
  end

  def profile
    @profile = Profile.new( Municipality.find_by_name(params[:id].titleize) )
    respond_to do |format|
      format.html
      format.csv { send_data @profile.to_csv, filename: "#{@profile.muni} Housing Data Profile.csv", disposition: 'attachment' }
    end
  end

  def download
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

  def guide
    @guide = OpenStruct.new(topic_areas: TopicArea.all)
    @muni  = Municipality.find_by_name(params[:id].titleize)
  end

  def form
    @muni = Municipality.find_by_name(params[:id].titleize)
    if @muni 
      redirect_to municipality_path(@muni)
    else
      redirect_to root_path
    end
  end

  def export
    @profile = Profile.new( Municipality.find_by_name(params[:id].titleize) )

    # Initialize DocxReplace with my template
    doc = DocxReplace::Doc.new("#{Rails.root}/lib/assets/template.docx", "#{Rails.root}/tmp")

    # Replace some variables
    matches = doc.uniq_matches(/\{(\@[\w\.]*)\}/)
    matches.each {|match| doc.replace("{#{match}}", "#{eval match}", true)}
    
    # Write the document back to a temporary file
    tmp_file = Tempfile.new('word_template', "#{Rails.root}/tmp")
    doc.commit(tmp_file)

    send_file tmp_file.path, filename: "#{@profile.muni} Housing Needs Assessment.docx", disposition: 'attachment'
  end

end
