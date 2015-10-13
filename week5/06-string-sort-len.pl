#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";

if (!@ARGV) {
    die "Please provide two sequences.\n";
}
say "sorted = " , join ', ', sort { length($a) <=> length($b) } @ARGV;
say "reverse = ", join ', ', sort { length($b) <=> length($a) } @ARGV;

__END__

Failed to sort by length.

Two points off.
