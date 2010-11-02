package Bronze::Types::LayoutTag;
use Moose;
use Bronze::Types::Constraints 'SystemName';
extends 'Bronze::Types::Taxonomy';

=head1 NAME

Bronze::Type::LayoutTag - Content Layout configuration

=head1 DESCRIPTION

This content defines the layout tags to be used in the application.

=head1 HIERARCHY

Bronze::Types::LayoutTag isa L<Bronze::Types::Taxonomy>

=cut

1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
