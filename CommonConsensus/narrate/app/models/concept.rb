class Concept < ActiveRecord::Base
    attr_accessible :relation, :node_b, :node_a
    
    
    def self.search(tokens,term="")

    results =   find_by_sql(["select distinct t.node_a from concepts t where t.relation = 'LocationOf'  and  t.node_a like ? and #{ (["(lower(t.node_b) like ? )"] * tokens.size).join(" or ") } order by t.node_a limit 20", term + '%', *tokens ])
    
    return results
    end


end
