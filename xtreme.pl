#!/usr/bin/perl
use strict;
use warnings;

use Dancer;
use xtreme;

set port => 5000;
set trace => 1;
set logger => 'console';

get '/' => sub { return &xtreme::answer(param('q')); };
 
start;
