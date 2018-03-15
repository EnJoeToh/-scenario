# -scenario

- 脚本でインデントを入れるのに疲れた
- 差分も取りたい

## Demo

new.html
<img width="1083" alt="new" src="https://user-images.githubusercontent.com/8622918/37465127-b274f286-289d-11e8-8c64-286597ccb69e.png">

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
