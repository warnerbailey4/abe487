#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";

if (!@ARGV) {
    die "Please provide two sequences.\n";
}
say "sorted = ", join(',', sort(@ARGV));
say "reverse = ", join(',', sort{$b cmp $a} (@ARGV));
