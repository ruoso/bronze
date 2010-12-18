package Bronze::Types::SimplePoll;
use Moose;
extends 'Bronze::Types::HTML';
use DateTime;
use namespace::clean -except => 'meta';

=head1 NAME

Bronze::Types::SimplePoll - Simple poll

=head1 DESCRIPTION

This implements a simple poll for the users to vote.

=head1 HIERARCHY

Bronze::Types::SimplePoll isa L<Bronze::Types::HTML>

=head1 ATTRIBUTES

=over

=item poll_open

This defines if the poll can still receive votes.

=cut

has poll_open => ( is => 'rw',
                   isa => 'Bool' );


=item poll_options

This return the list of options to be presented, with the associated
number of votes.

=cut

has poll_options => ( is => 'rw',
                      isa => 'HashRef[Int]' );


__PACKAGE__->meta->make_immutable;

1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
