#
# Written from scratch to address specific problems I was having with instiki/RedCloth
#
#   * Mismatched tags (especially DIVs) seriously messed up the page layout
#   * View Changes made code blocks hard to read (lost line breaks)
#   * Inserting/deleting block-level tags caused messed up page layout
#
# See An_html_janitor.initialze for a birds-eye view of the algorithm.
#
# (c) 2005 By Markus J. Q. Roberts
# Usage, modification, etc. of this program is permitted under the GPL, Ruby's License, Rail's
#     License, or Instiki's License (your choice)
#
require 'ostruct'
require 'cgi'

class An_html_janitor < String
    Tags_we_dont_expect_to_close = %w{ area br img input keygen li link meta p param td th thead tr }
    Priority = Hash.new( 0 ).update({ 'ins' => 10, 'del' => 10 })
    def initialize(raw_html)
        replace raw_html
        @safe_house = []
        sequester!("previous protected zone",/@protected \w+ \d+@/)
        sequester!("html comment",           /<!--.*?-->/m        )
        #To do: sequester attributes that contain "<" and/or ">"
        spiff_up('ins')
        spiff_up('del')
        ballance_tags
        remove_empty_spans
        unseal!("html comment","previous protected zone")
        end
    def stash(text)
        @safe_house << [[],text.to_s,[]]
        @safe_house.length - 1
        end
    def token_for(group,id)
        "@protected #{group} #{id}@"
        end
    def sequester!(group,reg_exp)
        gsub!(reg_exp) { |match| token_for(group,stash(match)) }
        end
    def unseal!(*groups)
        gsub!(/@protected (?:#{groups.join('|')}) (\d+)@/) { |n| @safe_house[$1.to_i] }
        end
    def wrap(token,new_pre,new_post)
        pre,core,post = @safe_house[token]
        @safe_house[token].replace [pre+[new_pre],core,[new_post]+post]
        end
    def escape_core(token)
        pre,core,post = @safe_house[token]
        @safe_house[token].replace [[],CGI.escapeHTML(core),[]]
        end
    def spiff_up(tag)
        gsub!(%r{<#{tag}(.*?)>(.*?)</#{tag}>}) {
            "<#{tag}#{$1}>#{CGI.escapeHTML($2.gsub(%r{<(/?\w+).*?>}) {"<#{$1}>"})}</#{tag}>"
            }
        end
    def ballance_tags
        stack = []
        gsub!(%r{<(.*?)>}) { |chunk| case $1
            when %r{/$}       #self-closing tag
              chunk
            when %r{^(\w+)}    #opening tag
              tag = $1.downcase
              #print "opening #{tag}  \n    #{stack.collect {|q| q.desc}.inspect}\n    #{@safe_house.inspect}#\n"
              if Tags_we_dont_expect_to_close.include? tag
                  chunk
                else
                  stack.push OpenStruct.new(
                      :tag => tag,
                      :priority => Priority[tag],
                      :text => chunk,
                      :start_tag => stash(chunk),
                      :expected_close => "</#{tag}>",
                      :desc => "#{chunk}...</#{tag}>"
                      )
                  token_for("start tag",stack.last.start_tag)
                end
            when %r{^/(\w+)}  #closing tag
              tag = $1.downcase
              #print "closing #{tag}\n    #{stack.collect {|q| q.tag}.inspect}\n    #{@safe_house.inspect}\n"
              if Tags_we_dont_expect_to_close.include? tag
                  mode = :ignore
                else
                  pre  = []
                  priority = Priority[tag]
                  outranked = false
                  while s = stack.pop and tag != s.tag
                      outranked ||= s.priority > priority
                      pre << s
                      end
                  mode = if !s or outranked
                      :escape_it
                    elsif tag != 'div'
                      :breaking_this_one
                    else
                      :breaking_others
                    end
                  stack.push *pre.reverse
                  end
              case mode
                when :breaking_this_one
                  pre.collect {|s| s.expected_close }.join  + chunk + pre.reverse.collect {|s| s.text }.join
                when :breaking_others
                  this_head = s.text
                  pre.each { |s| wrap(s.start_tag,chunk,this_head) }
                  chunk
                when :ignore
                  ''
                else
                  escape_core(s.start_tag) if s
                  CGI.escapeHTML(chunk)
                end
            else
              chunk
            end }
        replace self+stack.reverse.collect { |open_tag| open_tag.expected_close }.join
        unseal!("start tag")
        end
    def remove_empty_spans
        while gsub!(%r{<(\w+)[^>]*?></\1>},''); end
        end
    def remove_attributes(*attributes_to_remove)
        return self if attributes_to_remove.length == 0
        kill_pattern = /(#{attributes_to_remove.join('|')})(=(".*?"|\S*))?/i
        gsub!(%r{<(\w+) +(.*?)>}) { |match| "<#{$1} #{$2.gsub(kill_pattern,'')}>" }
        self
        end
    def remove_styles(*styles_to_remove)
        return self if styles_to_remove.length == 0
        style_kill_pattern = /(#{styles_to_remove.join('|')}).*?(;|$)/i
        gsub!(%r{<(\w+) +(.*?)>}i) { |match|
            "<#{$1} #{$2.gsub!(%r{style="(.*?)"}) { |match| "style=""#{$1.gsub(style_kill_pattern,'')}""" }}>"
            }
        self
        end
    end

def sanitize_html(raw_html)
    An_html_janitor.new(raw_html)
    end


