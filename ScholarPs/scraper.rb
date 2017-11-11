require 'nokogiri'

module ScholarPs
  # Scraping loan info
  class Scraper
    def process!
      # Mechanize gem can't be process JavaScript functions.
      # To alternate, Watir gem will working good.
      @watir = Watir::Browser.new(:firefox)
      login!
      loan_id_confirm!
      detail!
    end

    private

    def login!
      @watir.goto("#{ScholarPs::MyPage}/#{Links::Login}")

      @watir.text_field(Forms::Login::UserId)
            .set(LoginInfo::UserId)

      @watir.text_field(Forms::Login::Password)
            .set(LoginInfo::Password)

      @watir.button(Forms::Login::Submit)
            .click
      @watir
    end

    def loan_id_confirm!
      first, second, third = LoginInfo::LoanId.split('-')

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

      page = Nokogiri::HTML(@watir.html)

      # TODO: Scrape replayment detail info from viewing page
      # detail = page.search(Contents::Detail::RepaymentInfo)

      @watir.close

      # detail
      page
    end
  end
end
