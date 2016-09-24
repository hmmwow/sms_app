class TextMeController < ApplicationController

	def send_sms

		message = params[:message]
		number = params[:number]
		numeric = ["0","1","2","3","4","5","6","7","8","9"]
		num_split = number.split("")
		num_string = num_split.select { |n| numeric.include?(n) }
		num = num_string.join
		
		account_sid = 'ACa33c9801a93472246259babbd4238c8c'
		auth_token = '481942d33189799a3e7412eefff3d9f3'

		@client = Twilio::REST::Client.new account_sid, auth_token

		@message = @client.account.messages.create({

			

			:to => "#{num_string}", 
			:from => "+19172424733", 
			:body => "#{message}"
			})

	  redirect_to '/'
	end

end
