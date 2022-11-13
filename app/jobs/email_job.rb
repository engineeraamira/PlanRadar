# app/jobs/email_job.rb

class EmailJob < ActiveJob::Base

    # Email Provider Background Job
    # @param [String] email The emplyee email.
    # @param [String] title The title of the ticket.
    # @param [String] description The content of the ticket.
    def perform(params)     
        EmailService.new(params).call
    end

end