package xtreme;

use strict;
use warnings;

sub answer {
  my $q = shift;
  print STDERR "Query : $q\n";
  return "Xtreme startup";
}

1;
