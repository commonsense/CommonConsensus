require 'redcloth'

class RopaRojo < RedCloth
    def hard_break(text)
        @rules.each do |rule_name|
            method( rule_name ).call( text ) if rule_name.to_s.match /^pre_/
            end
        #super
        end
    def to_html(*rules,&callback)
        @callback = callback
        rules = DEFAULT_RULES if rules.empty?
        text = super(*([:pre_accordion,:pre_wiki_words,:pre_make_divs,:post_add_toggle]+rules))
        @rules.each do |rule_name|
            method( rule_name ).call( text ) if rule_name.to_s.match /^post_/
            end
        text
        end
    def htmlesc(str,mode)
        super
        str
        end
    ACCEDENTAL_WIKI_WORD = /(([A-Z]+[a-z0-9]+){2,})/
    def text_from(lines,block_type=nil)
        result = []
        while line = lines.shift and not (line =~ /^\.wiki_(?:accordion|notebook|tab)_end/)
            result << case line
              when /^\.wiki_accordion *(.*)$/
                name = "accordionDiv#{@panel}"
                "\n<div #{(shelve %Q{id="#{name}" class="accordionDiv"})}>"+
                text_from(lines,'accordion')+
                %Q{</div>
                <script type="text/javascript" language="javascript">
                // <![CDATA[
                #{ shelve "new Rico.Accordion( $('#{name}'), {panelHeight:350} );"}
                // ]]>
                </script>
                }
              when /^\.wiki_notebook *(.*)$/
              when /^\.wiki_tab *(.*)$/
                @panel += 1
                (shelve %Q{
                <div id="panel#{@panel}">
                <div id="panel#{@panel}Header"  class="accordionTabTitleBar">})+$1+"</div>"+
                (shelve %Q{<div id="panel#{@panel}Content" class="accordionTabContentBox"><div>})+
                text_from(lines,'tab')+
                "</div></div></div>"
              else line
              end
            end
        if line and block_type and line !~ /^\.wiki_#{block_type}_end/
            lines.unshift line
            line = nil
            end
        lines.unshift "\nERROR: expected '.wiki_#{block_type}_end'\n" if block_type and !line
        lines.unshift "\nERROR: unexpected '#{line}'\n"               if line and !block_type
        result.join
        end
    def pre_accordion(text)
        @panel = 1
        lines = text.split(/^(\.wiki_(?:accordion|notebook|tab)(?:_end)?.*?)$/im)
        text.replace text_from(lines)
        end
    # Bracket free text consists of either
    #      characters that are not "{" or "}",
    #      one or two "{"s, not followed by a third "{",
    #      one or two "}"s, not followed by a third "}",
    #
    BRACKET_FREE_TEXT = "((:?[^{}]|[{]{1,2}(?![{])|[}]{1,2}(?![}]))*?)"
    DIV_BRACKETS = /\{\{\{#{BRACKET_FREE_TEXT}\}\}\}/m
    ALT_TEXT = /
            (
            ([\s\[{(]|[#{PUNCT}])?     # $pre
            "                          # start
            (#{C})                     # $atts
            ([^"]+?)                   # $text
            \s?
            (?:\(([^)]+?)\)(?="))?     # $title
            ":
            )?
            /mx
    XDIV_RE = /
            (
            ([\s\[{(]|[#{PUNCT}])?     # $pre
            "                          # start
            (#{C})                     # $atts
            ([^"]+?)                   # $text
            \s?
            (?:\(([^)]+?)\)(?="))?     # $title
            ":
            )?
            #{DIV_BRACKETS}            # $div_block
        /mx
    DIV_RE = /#{ALT_TEXT}#{DIV_BRACKETS}/m

    def pre_make_divs( text )
        ## break the text into <div> blocks based on {{{ ... }}}
        while text.gsub!( DIV_RE ) { |m|
            has_link,pre,atts,link_text,title,div_block = $~.captures
            if has_link
                @need_toggle_function = true
                id   = "div_#{rand(100000)}"
                atts = shelve(" onclick=\"toggle('#{id}'); return false;\" #{ pba(atts) } title=\"#{ title||'more...' }\"")
                "#{ pre }<a#{ atts }>#{ link_text }</a><div id=\"#{id}\" style=\"display:none\">#{div_block}</div>"
              else
                "<div #{shelve(attrs) }>#{div_block}</div>"
              end
            }; end
        text
        end
    def post_add_toggle(text)
        text << %q{
            <script type="text/javascript" language="JavaScript">
            <!--
                 function toggle(name) {
                     q=document.getElementById(name);
                     if (q.style.display == 'none')
                         {q.style.display  = 'block';}
                       else
                         {q.style.display  = 'none';};
                     }
            //-->
            </script>
            } if @need_toggle_function
        end
    NOT_WIKI_WORD = /\\(([A-Z]+[a-z0-9]+){2,})/
    WIKI_WORD = /#{ALT_TEXT}(([A-Z]+['a-z1-9]+){2,})/
    WIKI_PHRASE = /#{ALT_TEXT}\[\[(.*?)\]\]/m
    def pre_wiki_words(text)
        text.gsub!(NOT_WIKI_WORD) { |m| shelve $1 }
        [WIKI_PHRASE,WIKI_WORD].each {|pattern|
            text.gsub!(pattern) { |m|
                has_link,pre,atts,link_text,title,ww = $~.captures
                (pre||'') + shelve(@callback.call(:wiki_link,pattern,pba(atts),link_text,ww))
                }
            }
        text
        end
    end
        
