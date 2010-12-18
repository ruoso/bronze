package Bronze::Types::HTML;
use Moose;
use HTML::TreeBuilder;
use Text::Unaccent;
use List::MoreUtils 'uniq';
extends 'Bronze::Types::Content';
use namespace::clean -except => 'meta';

=head1 NAME

Bronze::Types::HTML - Base for all text content

=head1 DESCRIPTION

This class represents all text contents.

=head1 HIERARCHY

Bronze::Types::HTML isa L<Bronze::Types::Content>

=head1 ATTRIBUTES

=over

=item title

This contains the title of the content.

=cut

has title => ( is => 'rw',
               isa => 'Str' );

=item content

This contains the actual content in HTML.

=cut

has content => ( is => 'rw',
                 isa => 'Str' );


=item media

This contains the media associated with this content.

=cut

has media => ( is => 'rw',
               isa => 'KiokuDB::Set' );

=back

=head1 Indexing

This type makes just a full "text" index on title and content.  It
also uses Text::Unaccent to normalize the tokens. It will use
HTML::Element->as_text to return the text tokens from the content
field.

=cut

sub EXTRACT {
    my $self = shift;
    my $tree = HTML::TreeBuilder->new_from_content($self->content);
    return { text => $self->_tokenize_words($tree->as_text, $self->title) };
}

sub _tokenize_words {
    my $self = shift;
    return
      [ uniq # if dups appear after normalization
        map { lc(unac_string('utf8', $_)) }
        uniq # reduce the number of calls to unac_string
        map { split qr/\s+/s, $_ }
        @_ ];
}

__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
