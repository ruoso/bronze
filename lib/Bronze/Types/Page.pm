package Bronze::Types::Page;
use Moose;
extends 'Bronze::Types::HTML';

=head1 NAME

Bronze::Types::Page - An specific page

=head1 DESCRIPTION

A page represent a content that is not time-oriented

=head1 HIERARCHY

Bronze::Types::Page isa L<Bronze::Types::HTML>

=head1 ATTRIBUTES

=over

=item abstract

This contains a small version of the page for display purposes.

=cut

has abstract => ( is => 'rw',
                  isa => 'Str' );


1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
