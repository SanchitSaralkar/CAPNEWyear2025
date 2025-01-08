namespace  learning;
using { 
cuid,
managed,
Currency,
Country,
sap.common.CodeList
 } from '@sap/cds/common';


entity books: cuid, managed{

    tile   : localized String(255);
    author : Association to Authors;
    genre  : Genre;
    publCountry : Country;
    stock : NoofBooks;
    price : price;
    isHardcover: Boolean;

}



type  Genre : Integer enum {

fiction = 1;
non_fiction = 2;

}

type NoofBooks : Integer;

type price {

    amount : Decimal;
    currency: Currency;
}


entity Authors: cuid , managed {
name : String(100);
dateodBirth : Date;
dateofDeath: Date;
Epoch : Association to  Epochs;
books: Association to many books
on books.author = $self;

}

entity  Epochs: CodeList {
    key id : Integer;
}
