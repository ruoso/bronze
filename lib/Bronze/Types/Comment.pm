package Bronze::Types::Comment;
use Moose;
extends 'Bronze::Types::HTML';
use DateTime;

=head1 NAME

Bronze::Types::Comment - User generated content

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

=cut

has commentor_auth_id => ( is => 'rw',
                           isa => 'Str' );


1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
