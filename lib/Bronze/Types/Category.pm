package Bronze::Types::Category;
use Moose;
use Bronze::Types::Constraints 'SystemName';
extends 'Bronze::Types::Taxonomy';
use namespace::clean -except => 'meta';

=head1 NAME

Bronze::Type::Category - Content Category configuration

=head1 DESCRIPTION

This content defines the categories to be used in the application.

=head1 HIERARCHY

Bronze::Types::Category isa L<Bronze::Types::Taxonomy>

=cut

__PACKAGE__->meta->make_immutable;

1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
