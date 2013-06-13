use strict;
use warnings;

package Test::Xtreme;
use base qw(Test::Class);
use Test::Most;
use xtreme;

sub test_default_answer : Tests {
  is(&xtreme::answer(''), "");
}

sub test_largest : Test {
  is(&xtreme::answer('3b658760: which of the following numbers is the largest: 263, 59, 7, 13'),'263');
}

sub test_plus : Test {
  is(&xtreme::answer('d480f420: what is 12 plus 6'), 18);
}

sub test_multiplied : Test {
  is(&xtreme::answer('b9ec0f00: what is 14 multiplied by 5'), 70);
}

sub test_square : Test {
 is(&xtreme::answer('84664780: which of the following numbers is both a square and a cube: 436, 729, 156, 1600'),729);
}

sub test_square_cube : Test {
 is(&xtreme::answer('7c8378a0: which of the following numbers is both a square and a cube: 100, 366, 1225, 766'),'');
}

sub test_paris : Test {
 is(&xtreme::answer('4b388780: which city is the Eiffel tower in'),'Paris');
}

sub test_david_cameron : Test {
 is(&xtreme::answer('4b388780: who is the Prime Minister of Great Britain'),'David Cameron');
}

sub test_prime : Test {
 is(&xtreme::answer('2922d710: which of the following numbers are primes: 197, 307, 907, 360'),'197, 307, 907');
}

sub test_previous_day : Test {
 is(&xtreme::answer('dc382380: what is the previous day of 15-08-2013'),'14-08-2013');
}

sub test_minus : Test {
  is(&xtreme::answer('6818c6b0: what is 9 minus 17'), -8);
}

sub test_power : Test {
  is(&xtreme::answer('8134f920: what is 2 to the power of 10'),1024);
}

sub test_fibonacci : Test {
  is(&xtreme::answer('what is the 18th number in the Fibonacci sequence'),1597);
}

sub test_cqrt : Test {
  is(&xtreme::cqrt(729), 9);
}

1;
