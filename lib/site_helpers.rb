module SiteHelpers
  def page_title
    if data.page.title
      [site_title, data.page.title].join(": ")
    else
      site_title
    end
  end

  def copyright_years(start_year=nil)
    return Date.today.year unless start_year

    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end
end
