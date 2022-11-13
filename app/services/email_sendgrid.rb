# app/services/email_sendgrid.rb

class EmailSendgrid

    require 'sendgrid-ruby'
    include SendGrid

    def initialize(email: "test@gmail.com", name: "user", title: "test",description: "try this",via:'no-reply@planradar.com')      
        @from = via
        @name = name
        @email = email
        @subject = title
        @content = description
    end

    def send_email
        @response = call_api(@name,@email,@from,@subject,@content) 
    end

  private
    def call_api(name,email,from,subject,text)    
            ac = ActionController::Base.new()
            from = SendGrid::Email.new(name: "PlanRadar", email: from)
            to = SendGrid::Email.new(email: email)
            subject = subject
            content = SendGrid::Content.new(type: 'text/plain', value: "#{text}")
            mail = SendGrid::Mail.new(from, subject, to, content)
            sg = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_key)
            response = sg.client.mail._('send').post(request_body: mail.to_json)  
            return response.to_json
            #puts response.to_json
    end

end

