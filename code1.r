allproduct<-list(
list(name="apple",price=0.5),
list(name="banana",price=0.6),
list(name="chiku",price=0.59),
list(name="grenapple",price=0.75),
list(name="grapes",price=0.55)
)
# intializee the list and print
cat("name \t price\n")
cat("========\n")
for(i in allproduct){
  cat(sprintf("%s \t %.2f\n",i$name,i$price))
}
# empty shopping cart
shoppingcart<-list()

cartitems<-list(
list(name="greenapple",quantity=5),
list(name="banana",quantity=6),
list(name="grapes",quantity=9)
)

# add carditems to shoppingcart if available
for(item in cartitems){
  productname=item$name
  qt=item$quantity
  
  product<-NULL
  for(p in allproduct){
    if(p$name==productname){
      product<-p
      break
    }
  }
  if(!is.null(product)){
    carditem<-list(name=product$name,price=product$price,quantity=qt)
      shoppingcart<-append(shoppingcart,list(carditem))
    cat("item is added\n")
  }
  else{
    cat("product is not there\n")
  }
}
subtotal<-0;
cat("Receipt\n")
cat("++++++\n")
for(item in shoppingcart){
  item_subtotal<-item$price*item$quantity
  subtotal<-subtotal+item_subtotal
  cat(sprintf("%s (%d units)-price:$%.2f-subtotal:$%.2f\n",item$name,item$quantity,item$price,item_subtotal))
  
}
taxrate<-0.08
tax_amount<-taxrate*subtotal
totalcost<-subtotal+tax_amount

cat(sprintf("subtotal:$%.2f\n",subtotal))
cat(sprintf("tax amount(8%%): $%.2f\n",tax_amount))
cat(sprintf("bill: $%.2f\n",totalcost))










