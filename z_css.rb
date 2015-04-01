require '../../LIBS/request'
require '../../LIBS/gentools'
require 'fileutils'
require 'uri'

urls = [
	'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css'
]


path = "app/assets/stylesheets/application.css"
file = File.read path
ajs = false
new_file = []
new_file << '/*'
file.each_line do |line|

	clean = true
	clean = false if line.strip == '*= require_tree .'
	clean = false if line.strip == '*= require_self'

	new_file << line.strip if clean && line.include?('*=')

end

urls.each do |url|

	JP url

	uri = URI.parse url
	filename = File.basename uri.path

	path = 'app/assets/stylesheets/Bootstrap'
	FileUtils::mkdir_p path
	call = Request.get url
	path << "/#{filename}"
	Write path,call[:body].to_s

	new_file << "*= require ./Bootstrap/#{filename}"

	JP "Done\n\n"

end

new_file << "*= require_tree ."
new_file << "*= require_self"

new_file << '*/'

new_file.uniq!

final = ''
new_file.each do |line|

	final << "#{line}\n"

end
path1 = "app/assets/stylesheets/application.css"
Write path1,final.strip
JP final