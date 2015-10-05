#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $in  = 'numbers.txt';
my $out = 'myresult.txt';

open my $out_fh, ">", $out;
open my $in_fh,  "<", $in;

while (my $number = <$in_fh>) {
    chomp $number;

    if ($number % 2 == 0 || $number < 25) {
        print $number, "\n";
    }

    else {
        my $factorial = 1;    #do not want a non-zero value

        while ($number > 0) {
            $factorial = $factorial * $number;
            $number--;
        }
        print $out_fh $factorial, "\n";
    }
}

close $in_fh;
close $out_fh;
