use strict;
use warnings;

package Test::Xtreme;
use base qw(Test::Class);
use Test::Most;
use xtreme;

sub test_default_answer : Tests {
  is(&xtreme::answer(''), "Xtreme startup");
}

1;
