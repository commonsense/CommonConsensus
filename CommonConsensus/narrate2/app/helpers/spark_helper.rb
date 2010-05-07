
# Provides a tag for embedding sparklines graphs into your Rails app.
#
# To use, load it in your controller with
#
#   helper :spark
#
# AUTHOR
#
# Geoffrey Grosenbach[mailto:boss@topfunky.com]
#
# http://topfunky.com
# 
# License
#
# This code is licensed under the MIT license.
#
module SparkHelper

	# Call with an array of data and a hash of params for the Spark module.
	# You can also pass :class => 'some_css_class' ('spark' by default).
	def spark_tag(results=[], options={})		
		url = { :controller => 'spark',
						:results => results.join(',') }
		options = url.merge(options)
		
		"<img src=\"#{ url_for options }\" class=\"#{options[:class] || 'spark'}\" alt=\"Sparkline Graph\" />"
	end

end
