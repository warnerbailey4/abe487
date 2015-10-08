#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";

if (!@ARGV) {
    die "Please provide a list of sequences.\n"
}
say "sorted = ", join(', ', sort (@ARGV)), "\n";

say "reverse = ", join(', ', sort {$b cmp $a} (@ARGV)), "\n";


