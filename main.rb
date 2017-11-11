# require 'pry'
require 'pp'
require_relative 'ScholarPs/scholar_ps'

# Debug Util
# 経過データの保存と読み込み
module Dump
  FilePath = File.expand_path('~/scholar_ps/dump.dat').freeze
  class << self
    def do!(obj)
      dat = Marshal.dump(obj)
      File.open(FilePath, 'wb') { |f| f.write(dat) }
    end

    def load
      dat = File.binread(FilePath)
      Marshal.load(dat)
    end
  end
end

scraper = ScholarPs::Scraper.new
detail = scraper.process!

# Debug
# Dump.do!(detail.serialize(save_with: Nokogiri::XML::Node::SaveOptions::AS_XML))
# detail = Nokogiri::HTML(Dump.load)

pp detail_info = detail.css(ScholarPs::Contents::Detail::RepaymentInfo + ' tr')
  .map(&:text)
  .map { |str| str.gsub(/[\n\s　]+/, ' ').strip }
  .map { |str| str.split(' ') }
  .map { |ar| key, *values = ar; {key.to_s => values} }
# =>
# [{"奨学生番号"=>["01234567891"]},
#  {"状態"=>["延滞"]},
#  {"学校名"=>["xxx学校"]},
#  {"貸与終了年月"=>["2000/03"]},
#  {"貸与総額"=>["9,999,000", "円"]},
#  {"利率算定方式"=>["xx方式"]},
#  {"利率"=>["1.23456789", "％"]},
#  {"返還総額(元金)"=>["9,999,000", "円"]},
#  {"割賦方法"=>["月賦"]},
#  {"月賦返還回数"=>["999", "回"]},
#  {"月賦返還額"=>["99,999", "円"]},
#  {"月賦最終回返還額"=>["99,999", "円"]},
#  {"月賦返還残回数"=>["99", "回"]},
#  {"月賦返還残額(元金)"=>["9999,999", "円"]},
#  {"前回入金年月日"=>["2017/01/21"]},
#  {"前回入金額"=>["99,999", "円"]},
#  {"現在請求額"=>["99,999", "円"]},
#  {"月賦延滞金"=>["0", "円"]},
#  {"月賦延滞期間"=>["～", "2017/1"]},
#  {"金融機関名"=>["xxx銀行"]},
#  {"口座番号"=>["99***99-***"]},
#  {"名義人氏名"=>["ショウガク", "タロウ"]},
#  {"口座加入年月"=>["2000/04"]},
#  {"保証制度"=>["制度名"]},
#  {"連絡先"=>["連絡先詳細内容を表示"]}]
