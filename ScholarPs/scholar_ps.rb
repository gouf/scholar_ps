# frozen_string_literal: true

# Dependensies:
# * Selenium Browser specific Drivers
#   + [SeleniumHQ - Downloads](http://www.seleniumhq.org/download/)
require 'watir'
require 'nokogiri'
require 'ostruct'

# 日本学生支援機構からローン情報ページを取得する
module ScholarPs
  BaseUrl = 'https://scholar-ps.sas.jasso.go.jp'
  MyPage = "#{BaseUrl}/mypage"

  require_relative './scraper/forms'
  require_relative './scraper/links'
  require_relative './scraper/contents'
  require_relative './scraper/login_info'
  require_relative './scraper/scraper'
  require_relative './exceptions'
end
