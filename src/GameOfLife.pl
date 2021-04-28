# Conway's game of life, but in Perl :)
#
# Written by Y.T. Chloe


use strict;
use warnings;
use diagnostics;

use feature "say";
use feature "switch";
use lib "lib";

use Board::TerminalBoard;
my $board = new TerminalBoard();
my $cells = new Cells();

do {


} while $board->getIteration() < 500 && $cells->hasAlive();  
