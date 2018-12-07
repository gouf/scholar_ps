# frozen_string_literal: true

module ScholarPs
  # ScholarPs 入力フォーム
  module Forms
    # ログイン
    module Login
      Name = { name: 'login_open' }.freeze
      UserId = { name: 'userId' }.freeze
      Password = { name: 'password' }.freeze
      Submit = { name: 'login_submit' }.freeze
    end

    # 奨学生番号の確認
    module LoanId
      # Name attributes
      Name = { name: 'syogkseiBgKakunin_open' }.freeze
      First = { name: 'syogkseiBg1' }.freeze
      Second = { name: 'syogkseiBg2' }.freeze
      Third = { name: 'syogkseiBg3' }.freeze
      Submit = { name: 'syogkseiBgKakunin_submit' }.freeze
    end
  end
end
