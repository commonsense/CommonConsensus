  
def parse(s)

 	s = s.downcase
    s.gsub!(/\!\?\.\;\,/, "")
    s.gsub!(/(ca|do|does)n\'t /, "not ")
    s.gsub!(/(ca|do|does)n\'t$/, "not")
    s.gsub!(/t\'s\s/, "t is ")
    s.gsub!(/\'ll\s/, " will ")
    s.gsub!(/\'re\s/, " are ")
    s.gsub!(/\'ve\s/, " have ")
    s.gsub!(/\'m /, " am ")
    s.gsub!(/^im /, "i am ")
    s.gsub!(/ im /, " i am ")
    s.gsub!(/^so you are/, "to be")
    s.gsub!(/^so (you |) (can |)/, "to ")
    s.gsub!(/very |a lot of |extremely |really /, "")
    s.gsub!(/(you|they|we|one|he|she|i) (could|can)/, '\1')
    f = "(a|an|the)"


  case s
    when /^(because)\s(\w+)\s(is)\s(.+)/;
      return "#{$2} is #{$4}"
    when /^(because)\s(\w+)\s(are)\s(.+)/;
      return "#{$2} are #{$4}"
    when /^(\w+ing)\s(.+)$/
      return "#{s}"
    when /^(\w+) (not |)(like) (.+)/
      return "#{$2} like #{$4}" 
    when /^(\w+) (I|you|they)(like) (.+)/
      return "#{$2} like #{$4}" 
    when/^(\w+)\s(want)\s(a|an|the)\s(.+)$/
      return "desire #{$4}"
    when/^(so |because |)they (\w+ |)give you (.+)/
      return "to receive #{$3}"
   when /^you\s(are|become|will\sbe|)\s(\w+)$/;
     return "be #{$2}"
    when /^your\s(\w+)\snot\s(.+)/;
     return "desire not "#{$1}  #{$2}"
   when /^(for|i am trying to|in\sorder\sto)((a|an|the)\s|)\s(.+)/;
     return "desire #{$4}"
   when /^so you (\w+) it (\w+)|(and$)|^\w+$/;
     return "#{s}"
    when /^(have|want|desire|need|require)\s(.+)/;
        case ($2)
           when /^(\w+)$/;
              return "need #{$1}"
            when /^(a|an|some|the)\s(.+)$/;
                    return "desire #{$2}"
            when /^(to)\s(\w+)\s(a|an)\s(.+)$/;
              return "#{$2} #{$4}"
            else
              return parse("to #{s}")
           end
    when /^(to)\s(\w+)\s(a|an)\s(\w+)$/;
       return "#{$2} #{$3} #{$4}"
    when /^to\s(\w+) (your|ones|my|his|her|their) (.+)/
       return "#{$1} #{$3}"
    when /^(because |)(\w+)\s(want|wants)\s(to) (\w+) (.+)$/
      return "#{$5} #{$6}"
    when /^so (you|i|they|one|it) (will |)(\w+s|\w+)$/;
        return "to #{$3}"
    when /^so (you|i|they|one|it) (will |)(\w+s|\w+)( not|) (.+)/;
      return "#{$3}#{$4} #{$5}" 
    when /^to get to ((the|a|an|some|your|my|their|ones) |)(\w+)$/
      return "arrive #{$3}"
    when /^(to)\s(\w+)\s(.+)$/;
       return "#{$2} #{$3}"
    when /(.+)(it)(.+)ing$/;
         return "#{s}"
    when /^\w+ of \w+$/;
        return "#{s}"
    when /(^too | too )/;
            return "#{s}"
    when /^(you|i|they|one) (are|have|am|is) (.+)/;
       return "#{$3}"\
    when /because (if|the) (.+)/
       return "#{$1} #{$2}"
    when /(\w+) (is) (.+)/
        return "#{$1} is #{$3}"
    when /makes you/;
       return "#{s}"
    when /^it is (.+)$|^because/
        return "#{s}"
    when /^(to)\s(\w+)$/;
        return "#{$1} #{$2}"
   when /^(be)\s(\w+)$/;
        return "#{$1} #{$2}"
   when /^(((because)\s|)(.+\sto$))|(.+is\sobvious.+)|(i not)$/
        return "#{s}"
   when /(.+)/
        return "#{$1}"

    end

  end
  
