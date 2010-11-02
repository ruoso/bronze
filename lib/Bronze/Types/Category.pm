package Bronze::Types::Category;
use Moose;
use Bronze::Types::Constraints 'SystemName';
extends 'Bronze::Types::Content';

=head1 NAME

Bronze::Type::Category - Content Category configuration

=head1 DESCRIPTION

This content defines the categories to be used in the application.

=head1 HIERARCHY

Bronze::Types::Category isa L<Bronze::Types::Content>

=head1 ATTRIBUTES

=over

=item system_name

Note that no logic is associated with subcategories, except that they
share the same prefix in their names by using slashes. This use the
SystemName constraint.

=cut

has system_name => ( is => 'rw',
                     isa => SystemName,
                     coerce => 1 );

=item display_name

This is a free-form string to be used to identify the category.

=cut

has display_name => ( is => 'rw',
                      isa => 'Str' );

1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
