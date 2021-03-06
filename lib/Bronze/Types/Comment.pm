package Bronze::Types::Comment;
# ABSTRACT: User generated content
use Moose;
extends 'Bronze::Types::HTML';
use DateTime;
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This represents a content generated from the user.

=head1 HIERARCHY

Bronze::Types::Comment isa L<Bronze::Types::HTML>

=head1 ATTRIBUTES

=over

=item comment_date

This is the chronological time to which this comment refers to.

=cut

has comment_date => ( is => 'rw',
                      isa => 'DateTime' );

=item commentor_address

This stores the IP address of the person doing the comment.

=cut

has commentor_address => ( is => 'rw',
                           isa => 'Str' );

=item commentor_auth_realm

The authentication realm used to identify this user.

=cut

has commentor_auth_realm => ( is => 'rw',
                              isa => 'Str' );

=item commentor_auth_id

The authentication id used by the user

=back

=cut

has commentor_auth_id => ( is => 'rw',
                           isa => 'Str' );

__PACKAGE__->meta->make_immutable;

1;
