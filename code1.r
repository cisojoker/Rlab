allproducts<-list(list(name="apple",price=30),
list(name="banana",price=20),
list(name="chiku",price=50),
list(name="biscuit",price=60),
list(name="bread",price=3.0),
list(name="milk",price=40),
list(name="cashew",price=100)
)
cat("<-------PRODUCTS----------->\n")
for(i in allproducts){
cat(sprintf("%s\t %.2f\n",i$name,i$price))
}
shoping<-list()
cartitem<-list(list(name="chiku",quantity=3),
list(name="milk",quantity=2),
list(name="biscuit",quantity=5)
)
for(i in cartitem){
  proname<-i$name
  proquant<-i$quantity
  product<-NULL
  for(j in allproducts){
    if(j$name==proname){
      product<-j
      break
    }
  }
  if(!is.null(product)){
    newlist<-list(name=product$name,price=product$price,quantity=proquant)
    shoping<-append(shoping,list(newlist))
  }
}
cat("item you are buying\n")
for (i in shoping){
  cat(sprintf("%s\t %.2f\t %.2f\n",i$name,i$price,i$quantity))
}
cat("item\t nettotal\n")
total<-0
for(i in shoping){
  total<-total+(i$price*i$quantity)
  cat(sprintf("%s\t %.2f\n",i$name,i$price*i$quantity))
}
cat(sprintf("total before tax is: %.2f\n",total))
tax<-total+(total*0.08)
cat(sprintf("total after tax(8percent) is: %.2f\n",tax))
