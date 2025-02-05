namespace  learning;
using { 
cuid,
managed,
Currency,
Country,
sap.common.CodeList
 } from '@sap/cds/common';


entity books: cuid, managed{

    tile   : localized String(255) @mandatory;
    author : Association to Authors @mandatory @assert.target;
    genre  : Genre @assert.range: true;
    publCountry : Country;
    stock : NoofBooks default 0;
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
name : String(100) @mandatory;
dateodBirth : Date;
dateofDeath: Date;
Epoch : Association to  Epochs @assert.target;
books: Association to many books
on books.author = $self;

}

entity  Epochs: CodeList {
    key id : Integer;
}

annotate books with 
{
modifiedAt  @odata.etag
}

annotate Authors with 
{
modifiedAt  @odata.etag
}
