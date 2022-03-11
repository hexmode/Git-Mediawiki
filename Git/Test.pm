package Git::Test;

use warnings;
use strict;

sub new {
	my ( $class, $configFile ) = @_;
	my $self = bless {}, $class;

	$self->readFile( $configFile );
}

sub readFile {
	my ( $self, $file ) = @_;

	open my $fh, "<", $file
		or die "Can't open $file: $!\n";
	$self->readFH( $fh );
	close $fh
		or die "Can't close $file: $!\n";
}

sub readFH {
	my ( $self, $fh ) = @_;

	while ( <$fh> ) {
		chomp;
		s/#.*//;
		s/^\s+//;
		s/\s+$//;
		next unless length;
		my ($key, $value) = split (/\s*=\s*/,$_, 2);
		$self->{$key} = $value;
		last if ($key eq 'LIGHTTPD' and $value eq 'false');
		last if ($key eq 'PORT');
	}
}

sub getWikiAddr {
	my ( $self ) = @_;

	return sprintf( q{http://%s:%d}. $self->{'SERVER_ADDR'}, $self->{'PORT'} );
}

sub getWikiUrl {
	my ( $self ) = @_;

	return sprintf( q{%s/%d/api.php}, $self->getWikiAddr(), $self->{'WIKI_DIR_NAME'} );
}

sub getWikiAdmin {
	my ( $self ) = @_;

	return $self->{'WIKI_ADMIN'};
}

sub getWikiAdminPass {
	my ( $self ) = @_;

	return $self->{'WIKI_PASSW'};
}

1;
