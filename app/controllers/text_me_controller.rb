require 'twilio-ruby'
require 'sinatra'

class TextMeController < ApplicationController


	def send_sms
		message = params[:message]
		number = params[:number]

		account_sid = 'ACa33c9801a93472246259babbd4238c8c'
		auth_token = '481942d33189799a3e7412eefff3d9f3'

		@client = Twilio::REST::Client.new account_sid, auth_token

		@message = @client.account.messages.create({
			:to => "+1"+"#{number}", 
			:from => "+19172424733", 
			:body => "#{message}"
			})

	  redirect_to '/'
	end

end
