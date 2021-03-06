#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;

use File::Basename;
use Cwd 'abs_path';
use lib abs_path(dirname($0));
use lib abs_path(dirname($0)).'/lib';

# "use" these, to find compilation errors at once
use jCinemaRPC;
use jCinemaRPC::WDTV;

use JSON::RPC::Server::Daemon;
my $server = JSON::RPC::Server::Daemon->new(LocalPort => 8080, Reuse => 1);
$server->dispatch({
	'/jCinemaRPC'			=> 'jCinemaRPC',
	'/jCinemaRPC/Desktop'	=> 'jCinemaRPC::Desktop',
	'/jCinemaRPC/WDTV'		=> 'jCinemaRPC::WDTV',
})->handle();
