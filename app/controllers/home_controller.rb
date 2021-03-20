class HomeController < ApplicationController
  def index
  	@articles = Article.all
  	# Book.where("title LIKE ?", "%" + params[:q] + "%")
  	@testimoni = Testimoni.order(:name).page(params[:page])
  	unless ! params[:q]
  		@testimoni = @testimoni.where("name LIKE ? OR testimoni LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
  	end
  	# Book.where(category: "Programming").or(Book.where(category: "Ruby"))
  	@testimoni =  @testimoni.per(10)
  	#@testimoni = Testimoni.page(2).per(1)
  	
  	# require 'net/smtp'
  	require 'mail'
  	mail = Mail.new do
	  from    'info@yourrubyapp.com'
	  to      'your@bestuserever.com'
	  subject 'Any subject you want'
	  body    '<h3>Lorem Ipsum</h3></br>John Doe'
	end
	Mail.defaults do
	  delivery_method :smtp, address: 'smtp.mailtrap.io', port: 2525
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
