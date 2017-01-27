# require 'rubygems'
# require 'json'

# proxy = ENV['HTTP_PROXY']
# clnt = HTTPClient.new(proxy)

# theURL = "http://data.tmsapi.com/v1.1/programs/" + params[:tmsId]
# content = clnt.get_content(theURL + "?imageSize=Sm&api_key=" + APP_CONFIG['kmmkhpsp3knctbavtxacrjxw'])
# @aMovie = JSON.parse(content, {'object_class' => 'Hash'})