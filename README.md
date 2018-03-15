# -scenario

- 脚本でインデントを入れるのに疲れた
- 差分も取りたい

## Demo

new.html
<img width="1087" alt="new" src="https://user-images.githubusercontent.com/8622918/37465896-c04910fc-289f-11e8-9e1b-d843b0f0f802.png">

diff.html
<img width="1089" alt="diff" src="https://user-images.githubusercontent.com/8622918/37465952-e89e6908-289f-11e8-8c5d-186b69c063da.png">

## Requirement

- ruby
    - DocDiff

## Usage

- ★: タイトル

- ■: シーン

- ＠: 描写

- ＃: コメント

整形する

```ruby genetrate.ruby new.txt > new.html```

差分をとる

```ruby difference.ruby old.txt new.txt > diff.html```

## License
modified BSD style license
