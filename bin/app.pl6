use v6.c;
use Bailador;
use Bailador::Route::StaticFile;

my $version = '0.0.1';

get '/' => sub {
    template 'index.html', { version => $version }
};

get '/user-rewards' => sub {
    template 'user-rewards.html', { version => $version }
};

static-dir / '/static/' (.+) / => 'static/';
baile();
