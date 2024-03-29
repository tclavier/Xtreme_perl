package xtreme;

use strict;
use warnings;
use DateTime;
use Date::Parse;

sub answer {
  my $q = shift;
  my $rep = '';

  open(my $fh, ">>", "xtreme.log") or die "Can't open xtreme.log";
  print ($fh "Query : $q\n");
  close ($fh);

  if ($q =~ m/(.*)which of the following numbers is the largest:(.*)/) {
    my $string = $2;
    $string =~ s/ //;
    my @nums = split(/,/, $string);
    my $max = 0;
    foreach my $num (@nums) {
      if ($num > $max) {$max = $num}
    }
    $rep = $max;
  } elsif ($q =~ m/(.*)what is (\d+) plus (\d+)/) {
    $rep = $2 + $3;
  } elsif ($q =~ m/(.*)what is (\d+) minus (\d+)/) {
    $rep = $2 - $3;
  } elsif ($q =~ m/(.*)what is (\d+) multiplied by (\d+)/) {
    $rep = $2 * $3;
  } elsif ($q =~ m/(.*)what is (\d+) to the power of (\d+)/) {
    $rep = $2 ** $3;
  } elsif ($q =~ m/(.*)which of the following numbers is both a square and a cube:(.*)/) {
    my $string = $2;
    $string =~ s/ //g;
    my @nums = split(/,/, $string);
    my @good = ();
    foreach my $num (@nums) {
      my $r2 = sqrt($num);
      my $r3 = cqrt($num);
      if ($r2 == int("$r2 ")) {
        if ("$r3" == int("$r3")) {
          push(@good, $num)
        }
      }
    }
    $rep = join(', ',@good);
  } elsif ($q =~ m/.*which city is the Eiffel tower in.*/) {
    $rep = 'Paris';
  } elsif ($q =~ m/.*who is the Prime Minister of Great Britain.*/) {
    $rep = 'David Cameron';
  } elsif ($q =~ m/.*what currency did Spain use before the Euro.*/) {
    $rep = 'peseta';
  } elsif ($q =~ m/.*what colour is a banana.*/) {
    $rep = 'yellow';
  } elsif ($q =~ m/.*who played James Bond in the film Dr No.*/) {
    $rep = 'Sean Connery';
  } elsif ($q =~ m/.*who created 'Il pulcino Pio'/) {
    $rep = 'Lucio Scarpa';
  } elsif ($q =~ m/(.*)which of the following numbers are primes:(.*)/) {
    my $string = $2;
    $string =~ s/ //g;
    my @nums = split(/,/, $string);
    my @good = ();
    foreach my $num (@nums) {
      if (is_prime($num)) { 
        push(@good, $num)
      }
    }
    $rep = join(', ',@good);
  } elsif ($q =~ m/(.*)what is the previous day of(.*)/) {
    my $string = $2;
    $string =~ s/ //g;
    my ($d,$m,$y) = split(/-/,$string);
    my $date = DateTime->new(year => $y, month=> $m, day=>$d);
    $date->subtract( days => 1 );
    $rep = $date->dmy('-');
  } elsif ($q =~ m/what is the (\d+)th number in the Fibonacci sequence/) {
    my $a1 = 0;
    my $a2 = 1;
    my $stop = $1;
    for ( 3 .. $stop ) {
      ( $a1, $a2 ) = ( $a2, $a1+$a2 );
    }
    $rep = $a2;
  } elsif ($q =~ m/what is your name/) {
    $rep = "Thomas";
  } else {
    print STDERR "Query : '$q'\n";
  }

  open($fh, ">>", "xtreme.log") or die "Can't open xtreme.log";
  print ($fh "Answer : $rep\n");
  close ($fh);

  return $rep;
}

sub is_prime {
  my $number = shift;
  my $sqrt = sqrt $number;
  my $d = 2;
  while (1) {
    return 0 if ( $number % $d == 0 );
    return 1 if ( $d > $sqrt );
    $d++;
  }
}

sub cqrt {
  my $n = shift;
  return $n ** (1/3);
}

1;
