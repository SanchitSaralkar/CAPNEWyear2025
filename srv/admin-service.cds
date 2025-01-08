using learning as db from '../db/schema';

service  AdminService @(path: '/admin') {

    entity books as projection on db.books;
    entity Authors as projection on db.Authors;
}