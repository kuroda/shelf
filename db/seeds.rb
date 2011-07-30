# -*- encoding: UTF-8 -*-

Book.create(
  :title => "ボッコちゃん",
  :authors => "星新一",
  :publish_year => 1958,
  :comment => "短編集",
  :checked_out => false
)

Book.create(
  :title => "日本沈没",
  :authors => "小松左京",
  :publish_year => 1973,
  :comment => "",
  :checked_out => false
)

Book.create(
  :title => "時をかける少女",
  :authors => "筒井康隆",
  :publish_year => 1967,
  :comment => "",
  :checked_out => true
)
