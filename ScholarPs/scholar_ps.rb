# Dependensies:
# * Selenium Browser specific Drivers
#   + [SeleniumHQ - Downloads](http://www.seleniumhq.org/download/)
require 'watir'
require 'nokogiri'
require 'dotenv'

# 日本学生支援機構からローン情報ページを取得する
module ScholarPs
  BaseUrl = 'https://scholar-ps.sas.jasso.go.jp'.freeze
  MyPage = "#{BaseUrl}/mypage".freeze

  require_relative './forms'
  require_relative './links'
  require_relative './contents'
  require_relative './login_info'
  require_relative './scraper'
end
