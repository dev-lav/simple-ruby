class HomeController < ApplicationController
  def index
  	@articles = Article.all
  	# Book.where("title LIKE ?", "%" + params[:q] + "%")
  	
  	# SEARCHING USING WHERE CONDITION 
  	@testimoni = Testimoni.order(:name).page(params[:page])
  	unless ! params[:q]
  		@testimoni = @testimoni.where("name LIKE ? OR testimoni LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
  	end
  	@testimoni =  @testimoni.per(10)
  	
	# HTTP REQUEST
	require 'httparty'
	# response = HTTParty.get('https://reqres.in/api/users?page=1')

	# response = HTTParty.post("https://reqres.in/api/users", 
	# 			body: {
	# 			    "name": "morpheus",
	# 			    "job": "leader"
	# 			})
	# @bo = response.body
	# @code = response.code

	# SENDING EMAIL
  	require 'net/smtp'
  	require 'mail'
  	mail = Mail.new do
	  from    'info@yourrubyapp.com'
	  to      'your@bestuserever.com'
	  subject 'Any subject you want'
	  body    '<h3>Lorem Ipsum</h3></br>John Doe'
	end
	Mail.defaults do
	  delivery_method :smtp, address: 'smtp.mailtrap.io', port: 2525, user_name: ENV['MAIL_USERNAME'],password: ENV['MAIL_PASSWORD']
	  mail.deliver
	end

	# mail.delivery_method :sendmail
	# puts mail.deliver
	# message = "Lorem Ipsum"
	# Net::SMTP.start("smtp.mailtrap.io", 2525) do |smtp|
	#   smtp.send_message message, 
	#   'info@yourrubyapp.com', 
	#   'your@bestuserever.com'
	# end
  end
end
