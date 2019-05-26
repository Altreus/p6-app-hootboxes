use v6;
use Red;
use App::Hootboxes::Schema;

my $*RED-DB = database "SQLite", :database<./hootboxes.db>;

deploy;
