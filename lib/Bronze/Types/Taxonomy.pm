package Bronze::Types::Taxonomy;
# ABSTRACT: Base class for configuration of classification
use Moose;
use Bronze::Types::Constraints 'SystemName';
extends 'Bronze::Types::AppInfo';
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This is the base class for all classification infra-estructure
classes. They all share the same format.

=head1 HIERARCHY

Bronze::Types::Taxonomy isa L<Bronze::Types::AppInfo>

=head1 ATTRIBUTES

=over

=item system_name

Note that no logic is associated with hierarchy, except that they may
share the same prefix in their names by using slashes. This use the
SystemName constraint.

=cut

has system_name => ( is => 'rw',
                     isa => SystemName,
                     coerce => 1 );

=item display_name

This is a free-form string to be used to identify the taxonomy.

=cut

has display_name => ( is => 'rw',
                      isa => 'Str' );

=item configuration

This is where configuration specific to this taxonomy should be stored.

=back

=cut

has configuration => ( is => 'rw',
                       isa => 'Str' );

__PACKAGE__->meta->make_immutable;

1;
