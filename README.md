[![Maintainability](https://api.codeclimate.com/v1/badges/8b7adecc304eaf7a29d0/maintainability)](https://codeclimate.com/github/gouf/scholar_ps/maintainability)

# Dependencies

* Selenium WebDriver : [Selenium - Web Browser Automation](http://www.seleniumhq.org/)

# Setup

# Gems

```sh
bundle install
```

## Authentication

The script needs some authentication informations.

```ruby
login_info = ScholarPs::LoginInfo.new(
  user_id: ENV['USER_ID'],
  password: ENV['PASSWORD'],
  loan_id: ENV['LOAN_ID'] # hyphen-seperated value
)
```

### Dotenv

You can use [dotenv](https://github.com/bkeepers/dotenv) in devlopment environment.

Put authentication info to `.env` file

```sh
USER_ID=my_user_name
PASSWORD=my_pass_word
LOAN_ID=012-34-567890 # 奨学生番号
```

**Note**: Please save `LOAN_ID` as hyphen-seperated

# Usage

Please read `main.rb` that in this project directories.

## Available data and format

Note: It may the size of element is not always fixed.

```ruby
# =>
# {"奨学生番号"=>["01234567891"],
#  "状態"=>["延滞"],
#  "学校名"=>["xxx学校"],
#  "貸与終了年月"=>["2000/03"],
#  "貸与総額"=>["9,999,000", "円"],
#  "利率算定方式"=>["xx方式"],
#  "利率"=>["1.23456789", "％"],
#  "返還総額(元金)"=>["9,999,000", "円"],
#  "割賦方法"=>["月賦"],
#  "月賦返還回数"=>["999", "回"],
#  "月賦返還額"=>["99,999", "円"],
#  "月賦最終回返還額"=>["99,999", "円"],
#  "月賦返還残回数"=>["99", "回"],
#  "月賦返還残額(元金)"=>["9999,999", "円"],
#  "前回入金年月日"=>["2017/01/21"],
#  "前回入金額"=>["99,999", "円"],
#  "現在請求額"=>["99,999", "円"],
#  "月賦延滞金"=>["0", "円"],
#  "月賦延滞期間"=>["～", "2017/1"],
#  "金融機関名"=>["xxx銀行"],
#  "口座番号"=>["99***99-***"],
#  "名義人氏名"=>["ショウガク", "タロウ"],
#  "口座加入年月"=>["2000/04"],
#  "保証制度"=>["制度名"],
#  "連絡先"=>["連絡先詳細内容を表示"]}
```
