# frozen_string_literal: true

module ScholarPs
  # 認証情報は正しいけれど、何らかの原因で通常通りのページの表示ができない
  class TimeoutOrIrregularAccess < StandardError
    def message
      %w[タイムアウトが発生したか、または正しくない方法で
         この画面にアクセスされた可能性があります。
         もう一度、始めの画面から入力しなおしてください。].join('')
    end
  end

  # アクセス先がメンテナンス中で通常通りのページの表示ができない
  class SiteOnMaintenance < StandardError
    def message
      'ただいまメンテナンス中です。'
    end
  end
end
