package Bronze::Model;
# ABSTRACT: The Model class for Bronze applications
use Moose;
use Search::GIN::Query::Manual;
use Search::GIN::Query::Set;
use MooseX::Method::Signatures;
use namespace::clean -except => 'meta';
use Module::Load;
use List::Util qw(first);

has user    => ( is => 'ro', required => 0 );
has schema  => ( is => 'ro', required => 1,
                 handles => [qw(store lookup new_scope)]);

=method object

This method will build an object of a given type with the given
attributes, but also sets values such as the owner of the data.

=cut

method object($type, $data is HashRef) {
    unless ($type =~ s/^\+//) {
        $type = 'Bronze::Types::'.$type;
    }
    load $type;
    unless ($data->{group} && first { $_ eq $data->{group} } $self->user->roles) {
        $data->{group} = ($self->user->roles)[0];
    }
    return $type->new
      ( %$data,
        owner => $self->user->id );
}

=method search

This method encapsulates the building of the Search::GIN::Query in a
simple hash. It also adds the security verification.

=cut

method search($filter is HashRef) {

    my $permquery = Search::GIN::Query::Manual->new
      ( method => 'any',
        values =>
        { accessible =>
          [ 'any',
            $self->user ?
            ( 'u:'.$self->user->id,
              map { 'g:'.$_ } $self->user->roles
            ):()
          ]
        }
      );

    my $userquery = Search::GIN::Query::Manual->new
      ( method => 'all',
        values => $filter );

    my $finalquery = Search::GIN::Query::Set->new
      ( operation => 'INTERSECT',
        subqueries => [ $userquery, $permquery ] );

    return $self->schema->search($finalquery);

}


__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 DESCRIPTION

This class implements the actual access to the data managed by
bronze. It should be understood as the actual API to the data.

=head1 SYNOPSIS

  use Bronze::Model;
  my $b = Bronze::Model->new( user => $user,
                              kiokudb => $kiokudb );
  $b->search({ text => [qw(foo bar baz)],
               type => 'Post' });

=head1 REQUISITES

This class expects the kiokudb object used here to support the keys
extracted by Bronze::GIN.

=head1 ATTRIBUTES

=over

=item user

This refers to the currently authenticated user. Bronze model will
enforce the permission model on all objects accessed. It should
support the "id" and "roles" method.

=item schema

This refers to the kiokudb instance that should be used.

=back

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
