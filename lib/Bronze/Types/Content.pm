package Bronze::Types::Content;
use Moose;
extends 'Bronze::Types::Data';
use Bronze::Types::Constraints 'PublishStatus';
use DateTime;

=head1 NAME

Bronze::Type::Content - Superclass for the actual content

=head1 DESCRIPTION

This class is the superclass for all the content types in bronze.

=head1 HIERARCHY

Bronze::Types::Content isa L<Bronze::Types::Data>

=head1 ATTRIBUTES

=over

=item status

This refers to the different statuses that a content might have. See
L<Bronze::Types::Constraints> for a complete description of the
different states.

=cut

has status => ( is => 'rw',
                isa => PublishStatus,
                default => 'draft' );


1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
