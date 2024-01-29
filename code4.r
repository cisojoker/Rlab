invitem<-character(0)
invqty<-numeric(0)
add<-function(at,qt){
  invitem<<-c(invitem,at)
  invqty<<-c(invqty,qt)
  cat("added successfully\n")
}
update <- function(it, qt) {
  if (it %in% invitem) {
    ind <- which(it == invitem)
    invqty[ind] <<- qt
    cat("update successfully\n")
  } else {
    cat("item not found\n")
  }
}
remove <- function(it) {
  if (it %in% invitem) {
    ind <- which(it == invitem)
    invitem <<- invitem[-ind]
    invqty <<- invqty[-ind]
    cat("removed item\n")
  } else {
    cat("item not found\n")
  }
}
display<-function(){
  for(i in 1:length(invitem)){
    cat("item: ",invitem[i],"quantity: ",invqty[i],"\n")
  }
}
while(TRUE){
  cat("1.Add item \n2.update item \n3.display \n4.remove\n5.exit\n")
  choice<-as.integer(readline("enter the choice"))
  if(choice==1){
     it<-readline("Enter the item")
     at<-as.integer(readline("enter the quantity"))
     add(it,at)
  }else if(choice==2){
     it<-readline("Enter the item")
     at<-as.integer(readline("enter the new quantity"))
     update(it,at)
  }else if(choice==3){
     display()
  }else if(choice==4){
     it<-readline("Enter the item")
     remove(it)
  }else if (choice == 5) {
    cat("Exiting the program. Goodbye!\n")
    break
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}
