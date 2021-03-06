# frozen_string_literal: true

module ScholarPs
  # Scraping loan info
  class Scraper
    def initialize(login_info_obj)
      # Mechanize gem can't be process JavaScript functions.
      # To alternate, Watir gem will working good.
      @watir = Watir::Browser.new(:firefox)

      @login_info = login_info_obj
    end

    def process!
      html =
        @watir.yield_self(&method(:login!))
              .yield_self(&method(:loan_id_confirm!))
              .yield_self(&method(:findout_loan_detail!))
              .yield_self(&:html)

      detail_page = Nokogiri::HTML(html)

      convert_to_hash_from_detail_page(detail_page)
    rescue TimeoutOrIrregularAccess => e
      puts e.message
      retry
    rescue SiteOnMaintenance => e
      puts e.message
    ensure
      @watir.close
    end

    private

    def login!(watir)
      watir.goto("#{ScholarPs::MyPage}/#{Links::LOGIN}")

      raise SiteOnMaintenance if watir.div(visible_text: /ただいまメンテナンス中/).present?

      watir.text_field(Forms::Login::USER_ID)
           .set(@login_info.user_id)

      watir.text_field(Forms::Login::PASSWORD)
           .set(@login_info.password)

      watir.button(Forms::Login::SUBMIT)
           .click
      watir
    end

    def loan_id_confirm!(watir)
      first, second, third = @login_info.loan_id.split('-')

      watir.text_field(Forms::LoanId::FIRST)
           .set(first)

      watir.select_list(Forms::LoanId::SECOND).select(second)

      watir.text_field(Forms::LoanId::THIRD)
           .set(third)

      watir.button(Forms::LoanId::SUBMIT)
           .click

      # 表示メッセージの検査
      raise TimeoutOrIrregularAccess if watir.div(visible_text: /タイムアウトが発生したか、または正しくない方法で/).present?

      watir
    end

    def findout_loan_detail!(watir)
      watir.link(href: "/mypage/#{Links::DETAIL}")
           .click
      watir
    end

    def convert_to_hash_from_detail_page(detail_page)
      detail_page.css(ScholarPs::Contents::Detail::RepaymentInfo + ' tr')
                 .map(&:text)
                 .map { |str| str.gsub(/[\n\s　]+/, ' ').strip }
                 .map { |str| str.split(' ') }
                 .map { |ar| key, *values = ar; { key.to_s => values } }
                 .inject({}) { |ret, h| ret.merge(h) }
    end
  end
end
