require 'dotenv'
Dotenv.load

module ScholarPs
  # ScholarPs ユーザ認証情報
  module LoginInfo
    UserId = ENV['USER_ID'].dup.freeze
    Password = ENV['PASSWORD'].dup.freeze
    LoanId = ENV['LOAN_ID'].dup.freeze
  end
end
