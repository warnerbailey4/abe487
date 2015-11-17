#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SearchIO;

main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    } 

    

my $file = shift(@ARGV) or pod2usage('Need Blast report');
my $in = Bio::SearchIO->new(-format => 'blast',
                            -file => $file);
say join "\t", qw(query_name hit_name evalue);
while( my $result = $in->next_result) {
    while( my $hit = $result->next_hit) {
        while( my $hsp = $hit->next_hsp) {
        if ($hsp->evalue < 1e-10) {
        say join "\t",
                    $result->query_name, 
                    $hit->name, 
                    $hit->description, 
                    $hsp->percent_identity, 
                    $hsp->length('total'), 
                    $hsp->evalue;
        }
    }
}

}
}
# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-bio-searchio.pl - a script

=head1 SYNOPSIS

  01-bio-searchio.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Bailey Alleen Warner E<lt>warnerbailey4@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 warnerbailey4

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
