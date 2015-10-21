#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $names = "bailey^kyle^moregan^graham^kenzie";
my @array =split(^, $names);
print @array;
