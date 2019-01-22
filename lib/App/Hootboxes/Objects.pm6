unit package App::Hootboxes;
use App::Hootboxes::DBObject;
class Reward;

class Account does DBObject {
    has @.transactions;

    method balance {
        @.transactions».total ==> sum()
    }

    method eligible-rewards {
        Reward.affordable-by(self.balance)
    }
}

class Reward does DBObject {
    has $!dbh;

    has $.value;
    has $.name;


}


class Student does DBObject {
    has $.name;
    has $.account;
}

class Transaction does DBObject {
    has $.account;
    has $.total;
}
