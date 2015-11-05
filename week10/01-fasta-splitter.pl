#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Bio::SeqIO;
use Getopt::Long;
use Pod::Usage;
use File::Spec::Functions 'catfile';
use File::Basename 'basename';
use File::Path 'make_path';
use Data::Dumper;
use Cwd;
main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    }; 

    my $max     = $args{'number'} || 500;
    my $out_dir = $args{'out_dir'} || getcwd;

    unless (-d $out_dir) {
        make_path($out_dir);
    }

    for my $file (@ARGV) {
        say $file;
        my $in  = Bio::SeqIO->new(-file => $file ,
                                  -format => 'Fasta');
        my $count = 0;
        my $file_ct = 0;
        my $out;
        while ( my $seq = $in->next_seq() ) {
            $count++;
            say "$count. ", $seq->id;
            if ($count == $max || !$out) {
                $count = 0;
                $file_ct++;
                my $out_file = catfile($out_dir, basename($file)) . ".$file_ct";
                say $out_file;
                $out = Bio::SeqIO->new(-file => ">$out_file" ,
                              -format => 'Fasta');
            }    

            $out->write_seq($seq);
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
        'out_dir=s',
        'number=i', 
    ) or pod2usage(2);

    return %args;
}
__END__
# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl 

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
