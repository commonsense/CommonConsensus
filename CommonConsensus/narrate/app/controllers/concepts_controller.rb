class ConceptsController < ApplicationController

  layout "feud"





  def index
    @concepts = Concept.find(:all, :conditions  => ["node_a = ? and relation = ?", "cat","CapableOf"], :limit => 100)
  end
  
   
  def view_concept
  end
end
