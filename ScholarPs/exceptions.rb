module ScholarPs
  # 認証情報は正しいけれど、何らかの原因で通常通りのページの表示ができない
  class TimeoutOrIrrgularAccess < StandardError
    def message
      %w[タイムアウトが発生したか、または正しくない方法で
         この画面にアクセスされた可能性があります。
         もう一度、始めの画面から入力しなおしてください。].join('')
    end
  end
end
