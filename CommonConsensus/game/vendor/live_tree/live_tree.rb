# Version:: 0.1
# Author:: Emanuel Borsboom (http://www.epiphyte.ca/)
# Copyright:: Copyright (c) 2005 Emanuel Borsboom
# License:: MIT (see LICENSE[link:files/LICENSE.html])
#
# See README[link:files/README.html] for general information about LiveTree.

module LiveTree

	def self.included(base) #:nodoc:
		super
		base.extend(ClassMethods)
	end
  
	module ClassMethods
	
		# Sets up this controller to serve data for a LiveTree.
		#
		# Arguments:
		# * +name+ - the tree's name.		
		# * <tt>options</tt> - may contain:
		#   * <tt>:model</tt> - name of the model to use for retrieving data (symbol).
		#   * <tt>:model_class</tt> - name of the model's class, incase it can't be inferred (string)
		#   * <tt>:get_item_name_proc</tt> - proc object which, when called with an item, returns the name of the item to display.
		#
		# Either one of <tt>:model</tt> or <tt>:model_class</tt> must be specified.
		#
		# If <tt>:get_item_name_proc</tt> is not specified, the item's <tt>name</tt> attribute is used.
		#
		# This example sets up this controller to serve data for a tree with name +family_tree+, that uses the +person+ model to get data:
		#
		#	class FamilyController < ApplicationController
		#		live_tree :family_tree, :model => :person
		#	end
		#
		# A data retrieval method is created that is named <em><tt><name></tt></em><tt>_live_tree_data</tt> (e.g. +family_tree_live_tree_data+)
		def live_tree(name, options = {})
			raise ":model or :model_class_name option is required" if options[:model] == nil && options[:model_class_name] == nil
			if options[:model_class_name] != nil
				model = options[:model_class_name]
			else
				model = Inflector.camelize(options[:model])
			end
			self.const_set("LIVE_TREE_OPTIONS_" + name.to_s.upcase, options);
			code = "" +
				"def #{name}_live_tree_options\n" +
				"	LIVE_TREE_OPTIONS_" + name.to_s.upcase + "\n" +
				"end\n" +
				"def #{name}_live_tree_data\n" +
				"	get_live_tree_data(" + model + ".find(live_tree_item_id), #{name}_live_tree_options)\n" +
				"end\n"
			#STDERR.write("\n\n#{code}\n\n")
			class_eval code
		end
	
	end
	
	module LiveTreeHelper
	
		def _recurse_live_tree_data(item, depth, get_item_name_proc, special_child_id = nil, special_child_data = nil) #:nodoc:
			result = "{id:" + item.id.to_s + ",name:'" + escape_javascript(get_item_name_proc.call(item).to_s) + "'"
			if item.children.size == 0
				result += ",children:[]"
			elsif depth == nil || depth > 1
				result += ",children:[\n"
				first = true
				for child in item.children
					result += ",\n" unless first
					first = false
					if child.id == special_child_id
						result += special_child_data
					else
						result += _recurse_live_tree_data(child, depth == nil ? nil : depth - 1, get_item_name_proc, special_child_id, special_child_data)
					end
				end
				result += "]"
			end
			result += "}"
			result
		end

		def _get_live_tree_data(item, options, params) #:nodoc:
			options ||= {}
			get_item_name_proc = Proc.new { |x| x.name }
			if options[:get_item_name_proc] != nil
				get_item_name_proc = options[:get_item_name_proc]
			end
			depth = params[:depth] == nil ? nil : params[:depth].to_i
			include_parents = params[:include_parents]
			root_item_id = params[:root_item_id] == nil ? nil : params[:root_item_id].to_i
			
			result = _recurse_live_tree_data(item, depth, get_item_name_proc)
			if include_parents
				while item.parent != nil && (root_item_id == nil || item.id != root_item_id)
					result = _recurse_live_tree_data(item.parent, 2, get_item_name_proc, item.id, result)
					item = item.parent
				end	
			end			
			return result;
		end
		
		def LiveTreeHelper.live_tree_js_name(name) #:nodoc:
			Inflector.camelize(name).sub(/^(.)/) { |s| $1.downcase }
		end
		
		# Embeds a LiveTree at the current location in the document.
		#
		# Arguments:
		# * +name+ - name of the tree
		# * +options+ - may contain any of the options documented in #construct_live_tree_function, as well as:
		#   * <tt>:js_variable_name</tt> - JavaScript variable name to assign the JavaScript LiveTree object to (optional).
		#
		# If <tt>:js_variable_name</tt> is not specified, the tree is assigned to a variable with the name of the tree converted to camelcase 
		# with a lowercase first letter (e.g. if the tree is named +family_tree+, it will be assigned to +familyTree+).
		def live_tree(name, options = {})
			options = options.dup;
			if options[:js_variable_name] != nil
				var_name = options[:js_variable_name]
			else
				var_name = LiveTreeHelper.live_tree_js_name(name)
			end
			options.delete :js_variable_name
			js = "var " + var_name + "=" + construct_live_tree_function(name, options) + ";"
			js += var_name + ".render();"
			return javascript_tag(js);
		end
		
		# Returns JavaScript code that constructs a JavaScript LiveTree object.
		#
		# Arguments:
		#
		# * +name+ - name of the tree
		#
		# * +options+ - most of these options are passed to the JavaScript LiveTree object as-is, but their 
		#   names are converted to camelcase-with-lowercase-first-letter (e.g. <tt>:on_click_item</tt> becomes <tt>onClickItem</tt>).  
		#   See LiveTreeClient[link:files/LiveTreeClient.html] for details details about those options.  In addition, the following may be
		#   specified:
		#
		#   * <tt>:id</tt> - HTML ID to give the tree's top HTML element (default is the tree's name).
		#   * <tt>:data_action</tt> - Action used by the tree to read data (default is "#{name}_live_tree_data").
		#   * <tt>:data_controller</tt> - Controller used by the tree to read data (default is the current controller).
		#   * <tt>:initial_data_root</tt> - Root item to construct initial tree data (optional, but you almost certainly want to include this).
		#   * <tt>:initial_data_whole_tree</tt> - Specifies whether the entire tree should be sent in the initial data, in which case the client will never have to contact the server for more data (default +false+, only used if <tt>:initial_data_root</tt> is specified).
		#   * <tt>:initial_data_options</tt> - Specifies options for constructing the initial data.  See #construct_live_tree_data for details.  If you used LiveTree::ClassMethods.live_tree to setup your controller, you don't need to specify this (the same values passed to live_tree are used).  (default <tt>{}</tt>, only used if <tt>:initial_data_root</tt>).
		def construct_live_tree_function(name, options = {})
			options = options.dup;
			if options[:id] != nil
				tree_id = options[:id]
			else
				tree_id = name
			end
			for k in [:on_click_item, :on_expand_item, :on_collapse_item, :on_load_item]
				if options[k] != nil
					options[k] = "function(item){" + options[k] + "}"
				end
			end
			if options[:data_url] == nil				
				if options[:data_action] == nil
					act = name.to_s + "_live_tree_data"
				else
					act = options[:data_action]
				end
				if options[:data_controller] == nil
					options[:data_url] = { :action => act }
				else
					options[:data_url] = { :controller => options[:data_controller], :action => act }
				end
			end
			options[:data_url] = '"' + escape_javascript(url_for(options[:data_url])) + '"'
			for k in [:css_class, :css_style]
				if options[k] != nil
					options[k] = '"' + escape_javascript(options[k]) + '"'
				end
			end
			if options[:initial_data_root] != nil
				item = options[:initial_data_root]
				if (options[:initial_data_whole_tree])
					depth = nil
				elsif (options[:expand_root_item] == nil || options[:expand_root_item] || options[:hide_root_item])
					depth = 2
				else
					depth = 1
				end
				
				if options[:initial_data_options] == nil
					data_options_method = controller.method("#{name}_live_tree_options")
					if data_options_method
						data_options = data_options_method.call
					else
						data_options = {}
					end
				else
					data_options = options[:initial_data_options]
				end
				data_options = data_options.dup
				data_options[:depth] = depth;
				options[:initial_data] = construct_live_tree_data(item, data_options)
			end
			options.delete :id
			options.delete :data_action
			options.delete :data_controller
			options.delete :initial_data_root
			options.delete :initial_data_options
			options.delete :initial_data_whole_tree
			options_js = "{\n" + options.map {|k, v| LiveTreeHelper.live_tree_js_name(k) + ":#{v}"}.join(",\n") + "\n}"			
			"new LiveTree(\"" + tree_id.to_s + "\"," + options_js + ")"
		end
		
		# Returns data in format appropriate for use with the <tt>:initial_data</tt> parameter of #construct_live_tree_function .
		#
		# Arguments:
		# * +item+ - Root item of the data.
		# * +options+ - Same options as LiveTree.get_live_tree_data, as well as:
		#   * <tt>:depth</tt> - How many level deep to recurse (default is +nil+, which means to recurse to the ends of all branches).
		def construct_live_tree_data(item, options = {})
			return _get_live_tree_data(item, options, options)
		end
		
	end
	
	# Renders data to return to a LiveTree data request.
	#
	# Arguments:
	# * +item+ - Item to return.
	# * +options+ - May contain the following:
	#   * <tt>:get_item_name_proc</tt> - Proc object which, when called with an item, returns the name of the item to display. (by default, the item's name is retrieved using the object's +name+ attribute).
	def get_live_tree_data(item, options = {})	
		#data = LiveTreeHelper.get_live_tree_data(item, options, params)
		#render :text => data
		render :inline => '<%= _get_live_tree_data(item, options, params) %>', :locals => { :item => item, :options => options }
	end

	# Returns the value of the item ID from the request's params.
	def live_tree_item_id
		params[:item_id]
	end
	
end
