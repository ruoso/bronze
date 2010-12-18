package Bronze::Types::AppInfo;
# ABSTRACT: Infraestructural data
use Moose;
extends 'Bronze::Types::Data';
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This is a class used to tag all data that is meant as application
configuration.

=head1 HIERARCHY

Bronze::Types::AppInfo isa L<Bronze::Types::Data>

=cut

__PACKAGE__->meta->make_immutable;


1;
