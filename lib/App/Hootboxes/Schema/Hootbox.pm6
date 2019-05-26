use Red;

model Hootbox is rw is export {
    has Int $.id        is serial;
    has Int $.reward    is referencing{ :model<Reward>, :column<id> };
    has Int $.level     is column;
}
