module ScholarPs
  # ScholarPs ユーザ認証情報
  class LoginInfo < OpenStruct
    def initialize(user_id:, password:, loan_id:)
      super
    end
  end
end
