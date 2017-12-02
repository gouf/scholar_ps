require 'nokogiri'

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
      login!
      loan_id_confirm!
      detail!
      detail_page = Nokogiri::HTML(@watir.html)
      @watir.close

      convert_to_hash_from_detail_page(detail_page)
    end

    private

    def login!
      @watir.goto("#{ScholarPs::MyPage}/#{Links::Login}")

      @watir.text_field(Forms::Login::UserId)
            .set(@login_info.user_id)

      @watir.text_field(Forms::Login::Password)
            .set(@login_info.password)

      @watir.button(Forms::Login::Submit)
            .click
      @watir
    end

    def loan_id_confirm!
      first, second, third = @login_info.loan_id.split('-')

      @watir.text_field(Forms::LoanId::First)
            .set(first)

      @watir.select_list(*Forms::LoanId::Second).select(second)

      @watir.text_field(Forms::LoanId::Third)
            .set(third)

      @watir.button(Forms::LoanId::Submit)
            .click
      @watir
    end

    def detail!
      @watir.link(href: "/mypage/#{Links::Detail}")
            .click
      @watir
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
