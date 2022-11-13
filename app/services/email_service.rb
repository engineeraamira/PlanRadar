# app/services/email_service.rb

class EmailService

    # GET Email params
    # @param [String] title The title of the email.
    # @param [String] description of the ticket.
    # @param [String] email the receiver email address.
    # @param [String] name the receiver name.
    # @param [String] EmailService_Provider The Email provider name.
    def initialize(params)
      @via = 'no-reply@planradar.com'
      @Email_Provider = 'sendgrid'
      @email = params[:email]
      @name = params[:name]
      @title = params[:title]
      @description = params[:description]
    end

    # Call a specific Email Provider and a specific function according to configuration
    def call   
            
      if @Email_Provider == 'sendgrid'
        @response = EmailSendgrid.new(email: @email,name: @name, title: @title,description: @description,via:@via).send_email
      end

    end

end