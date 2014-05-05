class MunicipalitiesController < ApplicationController

  def show
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

  def report
    @report = Report.new( Municipality.find_by_name(params[:id].titleize) )
  end

  def profile
    @profile = Profile.new( Municipality.find_by_name(params[:id].titleize) )
  end

  def download
    @muni = Municipality.find_by_name(params[:id].titleize)
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
    doc.replace("$$var1$$", "#{@profile.region.to_s}")
    doc.replace("$$var2$$", "#{@profile.county.average_ro}")
    doc.replace("$$var1$$", "#{@profile.state}")
    doc.replace("$$var2$$", "#{@profile.neighbors.median_ro}")
    doc.replace("$$var2$$", "#{@profile.county.average_o}") # doesn't overwrite or throw

=begin

  pass in variables hash, so we can do:
  variables.each {|var| doc.replace(var.placeholder, var.result)}

=end

    # Write the document back to a temporary file
    tmp_file = Tempfile.new('word_template', "#{Rails.root}/tmp")
    doc.commit(tmp_file)

    send_file tmp_file.path, filename: "#{@profile.muni} Housing Needs Assessment.docx", disposition: 'attachment'
  end

end
