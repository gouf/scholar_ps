# frozen_string_literal: true

module ScholarPs
  # ScholarPs 入力フォーム
  module Forms
    # ログイン
    module Login
      NAME = { name: 'login_open' }.freeze
      USER_ID = { name: 'userId' }.freeze
      PASSWORD = { name: 'password' }.freeze
      SUBMIT = { name: 'login_submit' }.freeze
    end

    # 奨学生番号の確認
    module LoanId
      # NAME attributes
      NAME = { name: 'syogkseiBgKakunin_open' }.freeze
      FIRST = { name: 'syogkseiBg1' }.freeze
      SECOND = { name: 'syogkseiBg2' }.freeze
      THIRD = { name: 'syogkseiBg3' }.freeze
      SUBMIT = { name: 'syogkseiBgKakunin_submit' }.freeze
    end
  end
end
