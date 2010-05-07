module CSSGraphs

  def bar_graph(*data)
    width = 378
    height = 150
    colors = %w(#ce494a #efba29 #efe708 #5a7dd6 #73a25a)
    floor_cutoff = 24
    
    html = <<HTML
  <style>
    #vertgraph {    				
        width: #{width}px; 
        height: #{height}px; 
        position: relative; 
        background-color: #eeeeee;
        border: 4px solid #999999;
        font-family: "Lucida Grande", Verdana, Arial;
    }
    #bars { 
        width: #{width}px; 
        height: #{height}px; 
        margin: 0; 
        padding: 0; 
        list-style-type: none;
    }
    #bars li {  
        position: absolute; 
        width: 28px; 
        height: #{height - 47}px; 
        bottom: 34px; 
        padding: 0 !important; 
        margin: 0 !important; 
        background-image: url("/images/css_graphs/colorbar.jpg") no-repeat !important;
        text-align: center; 
        font-weight: bold; 
        color: white; 
        line-height: 1.5em;
    }

    #labels { 
        width: #{width}px; 
        height: 25px; 
        margin: 0; 
        padding: 0; 
        list-style-type: none;
    }
    #labels li {  
        position: absolute; 
        width: 48px; 
        height: 25px;
        bottom: 0px;
        padding: 0 !important; 
        margin: 0 !important; 
        text-align: center; 
        color: #444444; 
        font-size: 0.8em;
    }
HTML

    bar_offset = 24;
    bar_increment = 75;
    bar_image_offset = 28;
    
    data.each_with_index do |d, index|
      bar_left = bar_offset + (bar_increment * index)
      label_left = bar_left - 10
      background_offset = bar_image_offset * index

      html += <<HTML
    #bars li.#{d[0].to_s.downcase} { left: #{bar_left}px; background-color: #{colors[index]}; background-position: -#{background_offset}px bottom !important; }
    #labels li.#{d[0].to_s.downcase} { left: #{label_left}px; background-position: -#{background_offset}px bottom !important; }
HTML
    end

    html += <<HTML
</style>
<div id="vertgraph">
    <ul id="bars">
HTML

    data.each_with_index do |d, index|
      html += <<HTML
        <li class="#{d[0].to_s.downcase}" style="height: #{d[1]}px;" title="#{d[1]}">#{d[1] < floor_cutoff ? '' : d[1]}</li>
HTML
    end

    html += <<HTML
    </ul>
    <ul id="labels">
HTML

    data.each_with_index do |d, index|
      html += <<HTML
        <li class="#{d[0].to_s.downcase}">#{d[0].to_s.humanize}</li>
HTML
    end

    html += <<HTML
    </ul>
</div>
HTML
  
    html
  end

end
