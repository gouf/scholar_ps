require 'dotenv'
Dotenv.load

module ScholarPs
  # ScholarPs ユーザ認証情報
  module LoginInfo
    UserId = ENV['USER_ID'].dup.freeze
    Password = ENV['PASSWORD'].dup.freeze
    LoanId = ENV['LOAN_ID'].dup.freeze

    # FIXME: Move to other Class or method difinition
    # The scraping data exists after authentication
    lambda do
      const_list =
        constants.map do |name|
          [name, const_get(name).to_s.length.zero?]
        end
      empty_const = const_list.find_all(&:last)
      raise "All of The LoginInfo constant values should not be empty.(#{empty_const.map(&:first).join(',')})" unless empty_const.size.zero?
    end.()
  end
end
