#!/usr/bin/env perl

use strict;
use feature 'say';

unless (@ARGV) {
    die "Where are my arguments?\n";
}

say "The args are ", join(', ', @ARGV);


