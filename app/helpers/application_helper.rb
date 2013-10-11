module ApplicationHelper
  require 'date'

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "WDIS"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def current_week
  	today = Date.today
    week1 = "10/9/2013".to_date
    week2 = "17/9/2013".to_date
    week3 = "24/9/2013".to_date
    week4 = "1/10/2013".to_date
    week5 = "8/10/2013".to_date
    week6 = "15/10/2013".to_date
    week7 = "22/10/2013".to_date
    week8 = "29/10/2013".to_date
    week9 = "5/11/2013".to_date
    week10 = "12/11/2013".to_date
    week11 = "19/11/2013".to_date
    week12 = "26/11/2013".to_date
    week13 = "3/12/2013".to_date
    week14 = "10/12/2013".to_date
    week15 = "17/12/2013".to_date
    week16 = "24/12/2013".to_date
    week17 = "31/12/2013".to_date

    case today
    when today < week1 then current_week = 1
    
      1
    end

    1
  end
end
