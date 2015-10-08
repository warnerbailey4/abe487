#!/usr/bin/env perl 

use strict;
use warnings;
use feature "say";

if (!@ARGV) {
    die "Please provide a list of numbers.\n";
}

say "default sort = ", join(', ', sort(@ARGV));
say "numerical sort = ", join (', ', sort {$a <=> $b} @ARGV);
say "reverse numerical sort = ", join (', ', sort {$b <=> $a} @ARGV);
