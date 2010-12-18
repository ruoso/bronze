package Bronze::Types::Category;
# ABSTRACT: Content Category configuration
use Moose;
use Bronze::Types::Constraints 'SystemName';
extends 'Bronze::Types::Taxonomy';
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This content defines the categories to be used in the application.

=head1 HIERARCHY

Bronze::Types::Category isa L<Bronze::Types::Taxonomy>

=cut

__PACKAGE__->meta->make_immutable;

1;
