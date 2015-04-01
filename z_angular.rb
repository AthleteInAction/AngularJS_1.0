require '../../LIBS/request'
require '../../LIBS/gentools'
require 'fileutils'
require 'uri'

urls = [
	'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular.js',
	'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular-resource.js',
	'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular-route.js',
	'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular-sanitize.js',
	# 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css',
	'https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.js'
]


path = "app/assets/javascripts/application.js"
file = File.read path
ajs = false
new_file = []
file.each_line do |line|

	clean = true

	clean = false if line.strip == '//= require turbolinks'
	clean = false if line.strip == '//= require_tree .'

	new_file << line.strip if clean && line.include?('//=')

end

urls.each do |url|

	JP url

	uri = URI.parse url
	filename = File.basename uri.path

	path = 'app/assets/javascripts/AngularJS'
	FileUtils::mkdir_p path
	call = Request.get url
	path << "/#{filename}"
	Write path,call[:body].to_s

	new_file << "//= require ./AngularJS/#{filename}"

	JP "Done\n\n"

end

new_file << "//= require_tree ."

new_file.uniq!

final = ''
new_file.each do |line|

	final << "#{line}\n"

end
path1 = "app/assets/javascripts/application.js"
Write path1,final.strip
JP final