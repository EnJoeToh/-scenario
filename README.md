# -scenario

- 脚本でインデントを入れるのに疲れた
- 差分も取りたい

## Demo

new.html
<img width="1087" alt="new" src="https://user-images.githubusercontent.com/8622918/37465896-c04910fc-289f-11e8-9e1b-d843b0f0f802.png">

diff.html
<img width="1080" alt="diff" src="https://user-images.githubusercontent.com/8622918/37465202-dc12c5aa-289d-11e8-90f4-8172f2a636b3.png">

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
