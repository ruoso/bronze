package Bronze::Types::Page;
# ABSTRACT: An specific page
use Moose;
extends 'Bronze::Types::HTML';
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

A page represent a content that is not time-oriented

=head1 HIERARCHY

Bronze::Types::Page isa L<Bronze::Types::HTML>

=head1 ATTRIBUTES

=over

=item abstract

This contains a small version of the page for display purposes.

=back

=cut

has abstract => ( is => 'rw',
                  isa => 'Str' );

__PACKAGE__->meta->make_immutable;


1;
