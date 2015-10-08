#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";

my @list = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);

say "array = ", join (', ', @list);  

my $pop = pop(@list);
say "popped = $pop, array = ", join (', ', @list);

my $shift = shift(@list);
say "shifted = $shift, array = ", join (', ', @list);

my $push = push @list, '12';
say "after push, array = ", join(', ', @list);

my $unshift = unshift (@list, '4');
say "after unshift, array = ", join(', ', @list);
 
