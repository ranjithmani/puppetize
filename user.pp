user { 'joe':
  ensure           => 'present',
  comment          => 'test-user',
  gid              => '48',
  home             => '/home/joe',
  password         => '$6$BaycLiR.$FjbrX/wnIYJC0kK56lwTyzeY2OUbJiY6VHMy0b1gH2gQOqiAEToosDeY8DJTkq5jPCY6hX81FRUvnX6R3cc3E0',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '505',
  managehome       => 'true',
}
